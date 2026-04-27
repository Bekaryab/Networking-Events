//
//  ChatStorageService.swift
//  networking&Events
//
//  Created by bekarys abiev on 27.04.2026.
//

//  ChatStorageService.swift

import Foundation

class ChatStorageService {
    static let shared = ChatStorageService()
    private let key = "saved_recent_chats"
    
    func saveChat(userId: String, userName: String) {
        var saved = loadChats()
        // Don't add duplicates
        guard !saved.contains(where: { $0["id"] == userId }) else { return }
        saved.insert(["id": userId, "name": userName], at: 0)
        if let data = try? JSONEncoder().encode(saved) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    func loadChats() -> [[String: String]] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let decoded = try? JSONDecoder().decode([[String: String]].self, from: data)
        else { return [] }
        return decoded
    }
}
