//
//  ChatRoomViewModel.swift
//  networking&Events
//
//  Created by bekarys abiev on 27.04.2026.
//

//  ChatRoomViewModel.swift

//  ChatRoomViewModel.swift

import Foundation
import SwiftUI
import Combine

@MainActor
class ChatRoomViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = []
    @Published var messageText: String = ""
    
    private let userId: String
    private let userName: String
    private var hasSaved = false // Save only once
    
    init(userId: String, userName: String) {
        self.userId = userId
        self.userName = userName
    }
    
    func sendMessage() {
        let text = messageText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return }
        
        let newMessage = ChatMessage(text: text, isSender: true)
        messages.append(newMessage)
        messageText = ""
        
        // ✅ Save this chat to Recent on first message sent
        if !hasSaved {
            ChatStorageService.shared.saveChat(userId: userId, userName: userName)
            hasSaved = true
        }
        
        // TODO: Firebase send
    }
}
