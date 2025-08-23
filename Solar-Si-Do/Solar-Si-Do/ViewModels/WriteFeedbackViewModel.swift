//
//  Untitled.swift
//  Solar-Si-Do
//
//  Created by Jay on 8/23/25.
//

import Foundation

@MainActor
class WriteFeedbackViewModel: ObservableObject {
    
    private let navigationManager = NavigationManager.shared
    
    @Published var rawInput: String = ""
    @Published var refinedFeedback: String = ""
    @Published var actionItems: [String] = []
    @Published var isLoading: Bool = false

    private let systemPrompt = """
You are an assistant that rewrites emotionally charged complaints about team members into empathetic, respectful, and constructive feedback — written in a way that the user can directly copy and send to the person concerned without further editing.

User input may include frustration, sarcasm, or blunt remarks.
Your task is to acknowledge the core concern, soften the tone, and rewrite the message as a clear, respectful, and sincere piece of feedback in the form of natural, professional dialogue.

Your output must contain:
1. `feedback`: The rewritten message only. No brackets, no alternatives.
2. `action_items`: A JSON array of 1–5 actionable suggestions for the teammate to improve, based on the original complaint. Each item should be a short imperative sentence. (e.g., “Share ideas during planning sessions instead of after finalization.”)

Your response must be a **JSON object** with two fields: `feedback` and `action_items`.

When writing `feedback`, follow these principles:
– Reflect the user’s underlying intention with softened, emotionally intelligent language
– Focus on specific behaviors and clear, non-accusatory suggestions for improvement
– Maintain a tone of collaboration, trust, and mutual respect
- Make it not too long

Example output:
{
  "feedback": "하워드, 항상 창의적인 아이디어를 적극적으로 내주셔서 프로젝트에 많은 활력을 더해주고 있어요. 특히 초기 단계에서 다양한 관점을 제시해주는 점은 정말 큰 강점이에요. 다만, ​진행 중인 단계에서 갑작스럽게 새로운 아이디어가 제시되면​ 현재 워크플로우에 혼란이 생기거나 일정 조율이 어려워질 때가 있어요. 예를 들어, 디자인 컨펌이 끝난 후 레이아웃 변경을 제안해주실 경우, 팀원들의 피로도가 높아지는 것 같아요.",
  "action_items": [
    "회의시간 5분 전에 도착하기",
    "수정 사항을 미리 이야기하기"
  ]
}
Please make all output in Korean.
"""

    func generateFeedback() {
        guard !rawInput.isEmpty else { return }
        isLoading = true
        let url = URL(string: "https://api.upstage.ai/v1/chat/completions")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer up_3DNo4d1JdFobSOexQqinbvctclBF7", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let messages: [[String: String]] = [
            ["role": "system", "content": systemPrompt],
            ["role": "user", "content": rawInput]
        ]

        let requestBody: [String: Any] = [
            "model": "solar-pro2",
            "messages": messages,
            "stream": false
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
        } catch {
            print("JSON encode error: \(error)")
            self.refinedFeedback = "⚠️ 요청을 생성하지 못했습니다."
            self.isLoading = false
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    print("❌ Error: \(error)")
                    self.refinedFeedback = "❌ 에러: \(error.localizedDescription)"
                    return
                }

                guard let data = data else {
                    self.refinedFeedback = "❌ 응답 없음"
                    return
                }

                do {
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                       let choices = json["choices"] as? [[String: Any]],
                       let message = choices.first?["message"] as? [String: Any],
                       let contentString = message["content"] as? String {

                        let trimmed = contentString.trimmingCharacters(in: .whitespacesAndNewlines)

                        if let contentData = trimmed.data(using: .utf8),
                           let contentJSON = try JSONSerialization.jsonObject(with: contentData) as? [String: Any],
                           let feedback = contentJSON["feedback"] as? String,
                           let actions = contentJSON["action_items"] as? [String] {

                            self.refinedFeedback = feedback
                            self.actionItems = actions

                            self.navigationManager.navigate(to: .main(.feedbackResult(
                                feedback: self.refinedFeedback,
                                actionItems: self.actionItems
                            )))
                        } else {
                            self.refinedFeedback = "⚠️ 응답을 이해할 수 없습니다 (중첩 JSON)."
                            self.actionItems = []
                        }
                    } else {
                        self.refinedFeedback = "⚠️ 응답을 이해할 수 없습니다."
                        self.actionItems = []
                    }
                } catch {
                    self.refinedFeedback = "⚠️ 디코딩 실패: \(error)"
                    self.actionItems = []
                }
            }
        }.resume()
    }
}
