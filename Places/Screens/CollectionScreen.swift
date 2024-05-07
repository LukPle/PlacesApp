import SwiftUI

struct CollectionScreen: View {
    @Environment(\.dismiss) private var dismiss
    
    var collection: CollectionModel
    
    var body: some View {
        NavigationView {
            ZStack {
                List(collection.places, id: \.name) { place in
                    Text(place.name)
                        .fontWeight(.medium)
                        //.foregroundColor(.white)
                }
                .colorMultiply(collection.color)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(collection.name)
                        //.foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    IconButton(iconName: "xmark") {
                        dismiss()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CollectionScreen(collection: restaurants)
}
