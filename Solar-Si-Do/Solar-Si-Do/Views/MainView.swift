
import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        Text("메인 뷰")
        Button(action:
                viewModel.tapNextButton
        ){
            Text("다음")
        }
    }
}
