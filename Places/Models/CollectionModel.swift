import Foundation
import SwiftUI

struct CollectionModel {
    let name: String
    let icon: String
    let color: Color
    let places: [String]
}

let restaurants = CollectionModel(name: "Restaurants", icon: "fork.knife", color: Color.orange, places: ["Bülens Kebab", "Schnitzel Fiesta", "Müllers Hendlstube", "Fischer Froni"])

let bars = CollectionModel(name: "Bars", icon: "wineglass.fill", color: Color.purple, places: ["Jasminas Weißweinhütte", "Zum Augustiner", "Drink n Fuck"])
