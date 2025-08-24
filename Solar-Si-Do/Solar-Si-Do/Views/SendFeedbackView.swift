//
//  SendFeedbackView.swift
//  Solar-Si-Do
//
//  Created by soyeonsoo on 8/24/25.
//

import SwiftUI

struct SendFeedbackView: View {
    var body: some View {
        ZStack {
            Color.sendwichYellow
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()

                Image("sandwich01")
                    .resizable()
                    .frame(width: 220, height: 160)
                    .shadow(color: Color(red: 0.4, green: 0.34, blue: 0.13).opacity(0.25), radius: 1.5, x: 0, y: 2)
                
                HStack{
                    Text("샌드위치 피드백 전달 완료!")
                        .font(.system(size: 20, weight: .bold))
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.green)
                }
                .padding()
                
                Spacer()
                
                Button {
                    NavigationManager.shared.navigate(to: .main(.home))
                } label: {
                    Text("다른 팀원 얘기하러 가기")
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.sendwichBrown)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 20)
        }
        .toolbar(.hidden)
    }
}

#Preview {
    SendFeedbackView()
}
