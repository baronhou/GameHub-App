//
//  Models.swift
//  GameHub App
//
//  Created by Baron Hou on 9/28/25.
//

import Foundation
import SwiftData

@Model
class GameStore {
    var name: String
    var address: String
    var latitude: Double
    var longitude: Double
    var events: [GameEvent]   // Relationship: a store can host many events
    var inventory: [InventoryItem] // Relationship: a store can have many items

    init(name: String,
         address: String,
         latitude: Double,
         longitude: Double) {
        self.name = name
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.events = []
        self.inventory = []
    }
}

@Model
class GameEvent {
    var title: String
    var date: Date
    var info: String
    var store: GameStore?   // Optional back-link to the hosting store

    init(title: String,
         date: Date,
         info: String,
         store: GameStore? = nil) {
        self.title = title
        self.date = date
        self.info = info
        self.store = store
    }
}

@Model
class InventoryItem {
    var name: String
    var price: Double
    var quantity: Int
    var store: GameStore?   // Optional back-link to the store selling it

    init(name: String,
         price: Double,
         quantity: Int,
         store: GameStore? = nil) {
        self.name = name
        self.price = price
        self.quantity = quantity
        self.store = store
    }
}

