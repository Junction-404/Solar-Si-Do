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
    @Published var isLoading: Bool = false

    private let systemPrompt = """
You are an assistant that rewrites emotionally charged complaints about team members into empathetic, respectful, and constructive feedback — written in a way that the user can directly copy and send to the person concerned without further editing.

User input may include frustration, sarcasm, or blunt remarks.
Your task is to acknowledge the core concern, soften the tone, and rewrite the message as a clear, respectful, and sincere piece of feedback in the form of natural, professional dialogue.

Your output must be directly shareable — do not include alternative versions, explanations, summaries, or any meta-comments.

Please follow these principles:
– Reflect the user’s underlying intention with softened, emotionally intelligent language
– Focus on specific behaviors and clear, non-accusatory suggestions for improvement
– Maintain a tone of collaboration, trust, and mutual respect
– Do not add extra commentary, options, or brackets — return only the final message

Example
User input: “Howard keeps throwing in random ideas after we finish the layout. It’s messing everything up.”
→ Output:
“Howard, I really appreciate how you consistently bring fresh ideas to the table — especially in the early stages. That said, when major changes are introduced after a layout has already been finalized, it can sometimes disrupt the workflow and strain the schedule. If possible, could we align on a process to integrate late-stage ideas more smoothly?”
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
                       let content = message["content"] as? String {
                        let refined = content.trimmingCharacters(in: .whitespacesAndNewlines)
                        self.refinedFeedback = refined
                        self.navigationManager.navigate(to: .main(.feedbackResult(refined)))
                    } else {
                        self.refinedFeedback = "⚠️ 응답을 이해할 수 없습니다."
                    }
                } catch {
                    self.refinedFeedback = "⚠️ 디코딩 실패: \(error)"
                }
            }
        }.resume()
    }
}
