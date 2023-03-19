
import SwiftUI

struct TabButtonView: View {
    var image: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {selectedTab = image}) {
            Image(systemName: image)
                .foregroundColor(selectedTab == image ? .black : .gray)
                .padding()
                .font(Font.title2.weight(.bold))
        }
    }
}


