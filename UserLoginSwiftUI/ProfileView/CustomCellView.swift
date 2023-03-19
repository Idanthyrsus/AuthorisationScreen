import SwiftUI

struct CustomCellView: View {
    var item: ProfileDataSource
    let customBackroundColor = CGColor(red: 245/255, green: 245/255, blue: 1, alpha: 1)
    var body: some View {
        Color(customBackroundColor)
            .overlay {
                HStack(spacing: 150) {
                    Image(systemName: item.image)
                        .frame(width: 50, height: 50)
                        .background(.thinMaterial)
                        .clipShape(Circle())
                        .padding()
                    Text(item.category)
                        .minimumScaleFactor(0.5)
                        .padding(.leading, -150)
                    Image(systemName: item.rightElement ?? "")
                        .padding(.leading, -50)
                }
            }
    }
}

struct CustomCellView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCellView(item: ProfileDataSource.dataSourceArray[0])
    }
}
