//
//  FeedbackResultView.swift
//  Solar-Si-Do
//
//  Created by soyeonsoo on 8/23/25.
//

import SwiftUI

struct FeedbackResultView: View {
    var refinedFeedback: String = ""
    var actionItems: [String] = []
    
        var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                Text("너의 생각들을 기반으로\n하워드에게 전달할 피드백을 정리했어")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, maxHeight: 140, alignment: .leading)

                Text(refinedFeedback)
                    .padding(20)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(10)
                
                if !actionItems.isEmpty {
                    Text("하워드에게 추천하는 액션 아이템")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.top, 18)
                    
                    ForEach(actionItems, id: \.self){ actionItem in
                        Text("\(actionItem)")
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("피드백 결과")
        }
}

#Preview {
    FeedbackResultView(refinedFeedback: "하워드, 항상 창의적인 아이디어를 적극적으로 내주셔서 프로젝트에 많은 활력을 더해주고 있어요. 특히 초기 단계에서 다양한 관점을 제시해주는 점은 정말 큰 강점이에요. 다만, ​진행 중인 단계에서 갑작스럽게 새로운 아이디어가 제시되면​ 현재 워크플로우에 혼란이 생기거나 일정 조율이 어려워질 때가 있어요. 예를 들어, 디자인 컨펌이 끝난 후 레이아웃 변경을 제안해주실 경우, 팀원들의 피로도가 높아지는 것 같아요.", actionItems: ["양말 신기", "열심히 말하기"])
}
