import SwiftUI

struct Collections: View {
    @State var cities: [CityModel] = [munich, vienna, prague, bratislava, paris, london]
    @State var currentCity: CityModel = munich
    @State var openSheet = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.blue.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 12) {
                    Spacer()
                    HStack() {
                        InfoPill(iconName: "archivebox.fill", text: "\(currentCity.collections.count) Collections", primaryColor: Color(red: 0/255, green: 119/255, blue: 182/255), secondaryColor: Color(red: 195/255, green: 234/255, blue: 255/255))
                        InfoPill(iconName: "mappin.and.ellipse", text: "\(countPlaces()) Places", primaryColor: Color(red: 194/255, green: 120/255, blue: 0/255), secondaryColor: Color(red: 255/255, green: 221/255, blue: 170/255))
                        Spacer()
                    }
                    VStack(spacing: 12) {
                        ForEach(currentCity.collections, id: \.name) { collection in
                            CollectionCard(collection: collection)
                        }
                    }
                    .padding(.top, 12)
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu {
                        ForEach(cities, id: \.displayName) { city in
                            Button(action: {
                                currentCity = city
                            }) {
                                Text(city.displayName)
                            }
                        }
                    } label: {
                        HStack(spacing: 7.5) {
                            Text(currentCity.displayName)
                                .foregroundColor(.black)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .frame(maxWidth: 220)
                            Image(systemName: "chevron.down")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                                .padding(.top, 5)
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
                self.cities.append(CityModel(name: city, emoji: "", collections: []))
                self.currentCity = cities[cities.count - 1]
            })
        }
    }
    
    func addCity() {
        openSheet = true
    }
    
    func countPlaces() -> Int {
        var totalPlaces = 0
        for collection in currentCity.collections {
            totalPlaces += collection.places.count
        }
        return totalPlaces
    }

}

#Preview {
    ContentView()
}
