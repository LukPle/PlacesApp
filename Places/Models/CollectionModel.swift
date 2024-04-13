import Foundation
import SwiftUI

struct CollectionModel {
    let name: String
    let icon: String
    let color: Color
    let places: [PlaceModel]
}

let restaurants = CollectionModel(name: "Restaurants", icon: "fork.knife", color: Color.orange, places: [PlaceModel(name: "Bülens Kebab"), PlaceModel(name: "Schnitzel Fiesta"), PlaceModel(name: "Müllers Hendlstube"), PlaceModel(name: "Fischer Froni")])

let bars = CollectionModel(name: "Bars", icon: "wineglass.fill", color: Color.purple, places: [PlaceModel(name: "Jasminas Weißweinhütte"), PlaceModel(name: "Zum Augustiner"), PlaceModel(name: "Drink n Fuck")])

let photoSpots = CollectionModel(name: "Photo Spots", icon: "camera.fill", color: Color.indigo, places: [PlaceModel(name: "River Side")])
