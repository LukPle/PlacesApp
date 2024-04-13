import Foundation

struct CityModel {
    let name: String
    let emoji: String?
    let collections: [CollectionModel]
    
    var displayName: String {
        if let emoji = emoji {
            return "\(emoji) \(name)"
        } else {
            return name
        }
    }
}

let munich = CityModel(name: "Munich", emoji: "🥨", collections: [restaurants, bars, photoSpots])
let vienna = CityModel(name: "Vienna", emoji: "🍷", collections: [bars])
let bratislava = CityModel(name: "Bratislava", emoji: "🏞️", collections: [restaurants, photoSpots])
let paris = CityModel(name: "Paris", emoji: "😎", collections: [photoSpots])
let london = CityModel(name: "London", emoji: "⚙️", collections: [bars, restaurants])
let prague = CityModel(name: "Prague", emoji: "🏰", collections: [restaurants])
