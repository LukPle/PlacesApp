import SwiftUI
import MapKit
import CoreLocation

struct MapScreen: View {
    @State var cities: [CityModel] = [munich, vienna, prague, bratislava, paris, london]
    @State var currentCity: CityModel = munich
    @State var openCollections = false
    
    var body: some View {
        Map()
            .overlay(
                Button(action: {
                    // Handle tap action here
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .opacity(0.75)
                            .shadow(color: Color.gray, radius: 4, x: 0, y: 2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.black, lineWidth: 0.5)
                            )
                            .frame(width: 50, height: 50)
                        
                        Image(systemName: "location.fill")
                            .resizable()
                            .frame(width: 17.5, height: 17.5)
                            .foregroundColor(.black)
                    }
                    .padding(.vertical, 30)
                    .padding(.horizontal, 15)
                },
                alignment: .topTrailing
            )
            .overlay(alignment: .bottomTrailing) {
                if(openCollections) {
                    VStack(alignment: .leading) {
                        Menu {
                            ForEach(cities.reversed(), id: \.displayName) { city in
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
                                    .font(.title3)
                                Image(systemName: "chevron.forward")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(.black)
                                    .padding(.top, 2.5)
                            }
                        }
                        Divider()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(currentCity.collections, id: \.name) { collection in
                                    CollectionCard(collection: collection)
                                }
                                .frame(width: UIScreen.main.bounds.width * 0.7)
                            }
                        }
                        .padding(.top, 7.5)
                    }
                    .padding()
                    .padding(.horizontal, 15)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .opacity(0.75)
                            .shadow(color: Color.gray, radius: 4, x: 0, y: 2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.black, lineWidth: 0.5)
                            )
                            .padding(.horizontal, 15)
                    )
                    .offset(y: -70)
                }
            }
            .overlay(
                Button(action: {
                    openCollections = !openCollections
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.blue)
                            .shadow(color: Color.gray, radius: 4, x: 0, y: 2)
                            .overlay(
                                Circle()
                                    .stroke(Color(red: 195/255, green: 234/255, blue: 255/255), lineWidth: 0.5)
                            )
                            .frame(width: 50, height: 50)
                        
                        Image(systemName: openCollections ? "archivebox" : "archivebox.fill")
                            .resizable()
                            .frame(width: 17.5, height: 17.5)
                            .foregroundColor(Color(red: 195/255, green: 234/255, blue: 255/255))
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                },
                alignment: .bottomTrailing
            )
    }
}

#Preview {
    ContentView()
}
