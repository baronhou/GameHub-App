//
//  User.swift
//  GameHub App
//
//  Created by Baron Hou on 9/28/25.
//

import SwiftData
import Foundation

@Model
final class User {
    @Attribute(.unique) var id: String
    var username: String
    var email: String
    var profileImageURL: String?
    var createdAt: Date
    
    // Relationships
    @Relationship(deleteRule: .nullify) var favoriteStores: [GameStore]?
    @Relationship(deleteRule: .nullify) var joinedClubs: [Club]?
    @Relationship(deleteRule: .cascade) var posts: [DiscussionPost]?
    
    init(id: String = UUID().uuidString, username: String, email: String, profileImageURL: String? = nil, createdAt: Date = Date()) {
        self.id = id
        self.username = username
        self.email = email
        self.profileImageURL = profileImageURL
        self.createdAt = createdAt
    }
}
