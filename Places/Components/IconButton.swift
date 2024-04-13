import SwiftUI

struct IconButton: View {
    var iconName: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .opacity(0.25)
                    .shadow(color: Color.gray, radius: 4, x: 0, y: 2)
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 0.5)
                        )
                    .frame(width: 35, height: 35)
                
                Image(systemName: iconName)
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    IconButton(iconName: "plus", action: {})
}
