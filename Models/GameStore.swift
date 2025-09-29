//
//  GameStore.swift
//  GameHub App
//
//  Created by Baron Hou on 9/28/25.
//

import SwiftData
import Foundation

@Model
final class GameStore {
    @Attribute(.unique) var id: String
    var name: String
    var storeDescription: String
    var latitude: Double
    var longitude: Double
    var address: String
    var city: String
    var state: String
    var zipCode: String
    var phone: String?
    var website: String?
    var rating: Double
    var reviewCount: Int
    
    // Relationships
    @Relationship(deleteRule: .cascade) var businessHours: [BusinessHour]?
    @Relationship(deleteRule: .cascade) var inventory: [InventoryItem]?
    @Relationship(deleteRule: .cascade) var hostedEvents: [Event]?
    @Relationship(deleteRule: .cascade) var posts: [DiscussionPost]?
    @Relationship(inverse: \User.favoriteStores) var favoritedBy: [User]?
    
    init(id: String = UUID().uuidString, name: String, storeDescription: String,
         latitude: Double, longitude: Double, address: String, city: String,
         state: String, zipCode: String, phone: String? = nil, website: String? = nil,
         rating: Double = 0.0, reviewCount: Int = 0) {
        self.id = id
        self.name = name
        self.storeDescription = storeDescription
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.phone = phone
        self.website = website
        self.rating = rating
        self.reviewCount = reviewCount
    }
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
