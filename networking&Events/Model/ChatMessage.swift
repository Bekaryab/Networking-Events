//
//  ChatMessage.swift
//  networking&Events
//
//  Created by bekarys abiev on 27.04.2026.
//

import Foundation

// Модель одного сообщения
struct ChatMessage: Identifiable, Hashable {
    let id: String // В Firebase ID обычно строковый
    let text: String
    let isSender: Bool
    let timestamp: Date // Добавили время, пригодится для сортировки из базы
    
    // Инициализатор по умолчанию, чтобы было удобно создавать сообщения
    init(id: String = UUID().uuidString, text: String, isSender: Bool, timestamp: Date = Date()) {
        self.id = id
        self.text = text
        self.isSender = isSender
        self.timestamp = timestamp
    }
}
