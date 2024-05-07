import SwiftUI

struct CollectionCard: View {
    let collection: CollectionModel
    
    var body: some View {
        NavigationLink(destination: CollectionScreen(collection: collection)) {
            ZStack(alignment: .topLeading) {
                collection.color
                    .cornerRadius(25)
                    .padding(.vertical, 6)
                    .shadow(color: Color.gray, radius: 2, x: 0, y: 1)
                VStack(alignment: .leading, spacing: 8) {
                    Spacer()
                    HStack {
                        Text(collection.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.leading, 12)
                        Spacer()
                        Text("\(collection.places.count) Places")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.top, 8)
                    }.padding(24)
                }
                
                Image(systemName: collection.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48, height: 48)
                    .foregroundColor(.white)
                    .opacity(0.3)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 32)
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
        }
    }
}

#Preview {
    CollectionCard(collection: restaurants)
}
