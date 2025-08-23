//
//  FeedbackResultView.swift
//  Solar-Si-Do
//
//  Created by soyeonsoo on 8/23/25.
//

import SwiftUI

struct FeedbackResultView: View {
    let feedback: String

        var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                Text("너의 생각들을 기반으로\n하워드에게 전달할 피드백을 정리했어")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, maxHeight: 140, alignment: .leading)

                Text(feedback)
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(10)

                Spacer()
            }
            .padding()
            .navigationTitle("피드백 결과")
        }
}

#Preview {
    FeedbackResultView(feedback: "Hello, World!")
}
