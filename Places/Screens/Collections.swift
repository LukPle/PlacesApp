import SwiftUI

struct Collections: View {
    @State var cities: [String] = ["🥨 Munich", "🏰 Prague", "🍷 Vienna", "🏞️ Bratislava", "🍺 Deggendorf", "Regensburg", "😎 Paris"]
    @State var currentCity: String = "Munich"
    @State var openSheet = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.blue.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    HStack() {
                        InfoPill(iconName: "archivebox.fill", text: "4 Collections", primaryColor: Color(red: 0/255, green: 119/255, blue: 182/255), secondaryColor: Color(red: 195/255, green: 234/255, blue: 255/255))
                        InfoPill(iconName: "mappin.and.ellipse", text: "20 Places", primaryColor: Color(red: 194/255, green: 120/255, blue: 0/255), secondaryColor: Color(red: 255/255, green: 221/255, blue: 170/255))
                        Spacer()
                    }
                    CollectionCard(collection: restaurants)
                    CollectionCard(collection: bars)
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu {
                        ForEach(cities, id: \.self) { city in
                            Button(action: {
                                currentCity = city
                            }) {
                                Text(city)
                            }
                        }
                    } label: {
                        HStack(spacing: 7.5) {
                            Text(currentCity)
                                .foregroundColor(.black)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .frame(maxWidth: 220)
                            Image(systemName: "chevron.down")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        IconButton(iconName: "slider.horizontal.3") {
                            // Add action for the button here
                        }
                        Menu {
                            Button("Add City", action: addCity)
                            Button("Add Collection", action: {})
                        } label: {
                            IconButton(iconName: "plus") {
                                // Add action for the button here
                            }
                        }
                    }
                }
            }
        }.sheet(isPresented: $openSheet) {
            AddSheet(onAddCity: { city in
                self.cities.append(city)
                self.currentCity = city
            })
        }
    }
    
    func addCity() {
        openSheet = true
    }

}

#Preview {
    ContentView()
}
