
import SwiftUI

struct CustomTabBarView: View {
    @State var selectedTab: String = "heart"
    var tabs = ["house", "heart", "basket", "message", "person"]
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedTab) {
               
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)
            
            HStack {
                ForEach(tabs, id: \.self) { image in
                    TabButtonView(image: image, selectedTab: $selectedTab)
                    
                    if image != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 10)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 34, style: .continuous))
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
    }
}



