import SwiftUI

struct AddSheet: View {
    @Environment(\.dismiss) private var dismiss
    
    var onAddCity: (String) -> Void

    @State var newCity: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Add a city")
                .font(.title)
            TextField(text: $newCity, prompt: Text("Name of the city")) {
                Text("Title")
            }

            HStack {
                Button("Cancel") {
                    // Cancel saving and dismiss.
                    dismiss()
                }
                Spacer()
                Button("Confirm") {
                    onAddCity(newCity)
                    dismiss()
                }
            }
        }
        .padding(.all, 30)
    }
}

#Preview {
    AddSheet(onAddCity: { _ in })
}

