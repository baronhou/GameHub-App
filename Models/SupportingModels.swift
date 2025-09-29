//
//  SupportingModels.swift
//  GameHub App
//
//  Created by Baron Hou on 9/28/25.
//

import SwiftData
import Foundation

@Model
final class BusinessHour {
    var dayOfWeek: String // "monday", "tuesday", etc.
    var openTime: String
    var closeTime: String
    var isClosed: Bool
    
    @Relationship(inverse: \GameStore.businessHours) var store: GameStore?
    
    init(dayOfWeek: String, openTime: String, closeTime: String, isClosed: Bool = false) {
        self.dayOfWeek = dayOfWeek
        self.openTime = openTime
        self.closeTime = closeTime
        self.isClosed = isClosed
    }
}

@Model
final class InventoryItem {
    @Attribute(.unique) var id: String
    var name: String
    var itemDescription: String
    var price: Double
    var condition: String
    var category: String
    var quantity: Int
    
    @Relationship(inverse: \GameStore.inventory) var store: GameStore?
    
    init(id: String = UUID().uuidString, name: String, itemDescription: String,
         price: Double, condition: String, category: String, quantity: Int = 1) {
        self.id = id
        self.name = name
        self.itemDescription = itemDescription
        self.price = price
        self.condition = condition
        self.category = category
        self.quantity = quantity
    }
}

@Model
final class DiscussionPost {
    @Attribute(.unique) var id: String
    var title: String
    var content: String
    var createdAt: Date
    var updatedAt: Date
    var likes: Int
    
    // Relationships
    @Relationship(deleteRule: .nullify) var author: User?
    @Relationship(deleteRule: .nullify) var targetStore: GameStore?
    @Relationship(deleteRule: .nullify) var targetEvent: Event?
    @Relationship(deleteRule: .nullify) var targetClub: Club?
    @Relationship(deleteRule: .cascade) var comments: [Comment]?
    
    init(id: String = UUID().uuidString, title: String, content: String,
         createdAt: Date = Date(), updatedAt: Date = Date(), likes: Int = 0) {
        self.id = id
        self.title = title
        self.content = content
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.likes = likes
    }
}

@Model
final class Comment {
    @Attribute(.unique) var id: String
    var content: String
    var createdAt: Date
    var likes: Int
    
    @Relationship(inverse: \DiscussionPost.comments) var post: DiscussionPost?
    @Relationship(deleteRule: .nullify) var author: User?
    
    init(id: String = UUID().uuidString, content: String, createdAt: Date = Date(), likes: Int = 0) {
        self.id = id
        self.content = content
        self.createdAt = createdAt
        self.likes = likes
    }
}

