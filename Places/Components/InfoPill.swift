import SwiftUI

struct InfoPill: View {
    var iconName: String;
    var text: String;
    var primaryColor: Color;
    var secondaryColor: Color;
    
    var body: some View {
        HStack(spacing: 5) {
            Circle()
                .fill(primaryColor)
                .frame(width: 28, height: 28)
                .overlay(
                    Image(systemName: iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .foregroundColor(secondaryColor)
                )
            Text(text)
                .fontWeight(.medium)
                .foregroundColor(primaryColor)
                .padding(.trailing, 7.5)
        }
        .padding(.all, 4)
        .background(secondaryColor)
        .opacity(0.9)
        .cornerRadius(25)
    }
}

#Preview {
    InfoPill(
        iconName: "person.fill",
        text: "Text",
        primaryColor: Color.blue,
        secondaryColor: Color.red
    )
}
