//
//  Room.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 6.08.2023.
//

import UIKit

struct Room: Identifiable, Codable {
    
    var id: String = UUID().uuidString
    var name: String
    var desc: String
    var date: String
    var capacity: Int
    var category: Categories
    
}

enum Categories: String, Codable {
    case Sport
    case Game
    case Chat
    case Art
    case Food
    case Study
}

#if DEBUG
extension Room {
    static var sampleData: [Room] = [
        Room(name: "Voleybol",desc:"Voleybol desc", date: "12 Agu 2023", capacity: 12, category: .Sport),
        Room(name: "Yüzme",desc:"Yüzme desc", date: "13 Agu 2023", capacity: 2, category: .Sport),
        Room(name: "Fitness",desc:"Fitness desc", date: "14 Agu 2023", capacity: 4, category: .Sport)
    ]
}
#endif
