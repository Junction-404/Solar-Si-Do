
import SwiftUI

struct WriteFeedbackView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        Text("피드백 작성")
    }
}
