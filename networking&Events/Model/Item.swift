//
//  Item.swift
//  networking&Events
//
//  Created by bekarys abiev on 20.03.2026.
//

import Foundation
struct EventItem: Identifiable, Codable, Equatable, Hashable{
    var id = UUID()
    var photoData: Data?
    var title1: String?
    var location1: String?
    var Date1: Date?
    var guests1: String?
    var description1: String?
}

struct users: Identifiable, Decodable, Hashable{
    var id: String
    var name: String
    var lastName: String
}
