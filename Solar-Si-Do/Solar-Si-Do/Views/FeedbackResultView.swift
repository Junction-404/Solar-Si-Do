//
//  FeedbackResultView.swift
//  Solar-Si-Do
//
//  Created by soyeonsoo on 8/23/25.
//

import SwiftUI

struct FeedbackResultView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isRawVisible: Bool = false
    
    var refinedFeedback: String = ""
    var actionItems: [String] = []
    let rawInput: String
    
    let peerName: String = "엘레나"
    
    var body: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 23))
                    .foregroundColor(.black)
                    .padding(8)
            }
            
            Spacer()
        }
        .padding(.horizontal, 14)
        
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                HStack{
                    Image("sendySmile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 110, height: 120)
                    
                    Spacer()
                    
                    ZStack{
                        Image("speechBubbleGreen")
                            .resizable()
                            .frame(width: 248, height: 76)
                        
                        Text("너의 생각들을 기반으로\n피드백을 정리했어")
                            .font(.system(size: 17, weight: .semibold))
                            .lineSpacing(2)
                    }
                }
                .padding(.top, 12)
                .padding(.bottom, -6)
                .padding(.horizontal, 20)
                
                Text(refinedFeedback)
                    .padding(20)
                    .background(Color.sendwichYellow)
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
                
                if !actionItems.isEmpty {
                    Text("엘레나에게 추천하는 액션 아이템")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.top, 18)
                        .padding(.horizontal, 20)
                    
                    ForEach(actionItems, id: \.self){ actionItem in
                        Text("  •  \(actionItem)")
                            .padding(-8)
                    }
                    .padding(.horizontal, 20)
                }
                
                HStack{
                    Text("내가 엘레나에 대해 한 이야기")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.top, 18)
                    
                    Spacer()
                    
                    Button(action: {
                        isRawVisible.toggle()
                    }) {
                        Image(systemName: isRawVisible ? "chevron.up" : "chevron.down")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.top, 18)
                    }
                }
                .padding(.horizontal, 20)

                
                if isRawVisible {
                    Text(rawInput)
                        .font(.system(size: 14))
                        .foregroundColor(.black.opacity(0.8))
//                        .padding()
                        .background(Color.white)
//                        .cornerRadius(12)
//                        .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 1)
//                        .transition(.opacity)
                        .padding(.horizontal, 20)
                }
                Spacer()
            }
            
        }
        .navigationTitle("피드백 결과")
        .toolbar(.hidden)
        
        HStack{
            Button {
                //
            } label: {
                Text("수정")
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                    .frame(maxWidth: 120)
                    .background(.sendwichYellow)
                    .foregroundColor(.sendwichBrown)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.sendwichBrown, lineWidth: 1)
                    )
            }
            Button {
                //
            } label: {
                Text("피드백 전달")
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.sendwichBrown)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    FeedbackResultView(
        refinedFeedback: "하워드, 항상 창의적인 아이디어를 적극적으로 내주셔서 프로젝트에 많은 활력을 더해주고 있어요. 특히 초기 단계에서 다양한 관점을 제시해주는 점은 정말 큰 강점이에요. 다만, ​진행 중인 단계에서 갑작스럽게 새로운 아이디어가 제시되면​ 현재 워크플로우에 혼란이 생기거나 일정 조율이 어려워질 때가 있어요. 예를 들어, 디자인 컨펌이 끝난 후 레이아웃 변경을 제안해주실 경우, 팀원들의 피로도가 높아지는 것 같아요.",
        actionItems: ["양말 신기", "열심히 말하기"],
        rawInput: "보노보노 관점을 제시해주는 점은 정말 큰 강점이에요. 다만, ​진행 중인 단계에서 갑작스럽게 새로운 아이디어가 제시되면​ 현재 워크플로우에 혼란이 생기거나 일정 조율이 어려워질 때가 있어요. 예를 들어, 디자인 컨펌이 끝난 후 레이아웃 변경을 제안해주실 경우, 팀원들의 피로도가 높아지는 것 같아요. 관점을 제시해주는 점은 정말 큰 강점이에요. 다만, ​진행 중인 단계에서 갑작스럽게 새로운 아이디어가 제시되면​ 현재 워크플로우에 혼란이 생기거나 일정 조율이 어려워질 때가 있어요. 예를 들어, 디자인 컨펌이 끝난 후 레이아웃 변경을 제안해주실 경우, 팀원들의 피로도가 높아지는 것 같아요.")
}
