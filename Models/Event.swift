//
//  Event.swift
//  GameHub App
//
//  Created by Baron Hou on 9/28/25.
//

import SwiftData
import Foundation

@Model
final class Event {
    @Attribute(.unique) var id: String
    var title: String
    var eventDescription: String
    var latitude: Double
    var longitude: Double
    var address: String
    var startDate: Date
    var endDate: Date
    var maxParticipants: Int?
    var currentParticipants: Int
    var entryFee: Double?
    var eventType: String // "tournament", "meetup", etc.
    
    // Relationships
    @Relationship(deleteRule: .nullify) var organizerStore: GameStore?
    @Relationship(deleteRule: .nullify) var organizerClub: Club?
    @Relationship(deleteRule: .cascade) var posts: [DiscussionPost]?
    
    init(id: String = UUID().uuidString, title: String, eventDescription: String,
         latitude: Double, longitude: Double, address: String, startDate: Date,
         endDate: Date, maxParticipants: Int? = nil, currentParticipants: Int = 0,
         entryFee: Double? = nil, eventType: String = "meetup") {
        self.id = id
        self.title = title
        self.eventDescription = eventDescription
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.startDate = startDate
        self.endDate = endDate
        self.maxParticipants = maxParticipants
        self.currentParticipants = currentParticipants
        self.entryFee = entryFee
        self.eventType = eventType
    }
}
