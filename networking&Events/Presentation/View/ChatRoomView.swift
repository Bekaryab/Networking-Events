//
//  ChatRoomView.swift
//  networking&Events
//
//  Created by bekarys abiev on 27.04.2026.
//

//  ChatRoomView.swift

//  ChatRoomView.swift

import SwiftUI

struct ChatRoomView: View {
    let userId: String
    let userName: String
    
    @StateObject private var viewModel: ChatRoomViewModel
    
    init(userId: String, userName: String) {
        self.userId = userId
        self.userName = userName
        _viewModel = StateObject(wrappedValue: ChatRoomViewModel(userId: userId, userName: userName))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.messages) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding()
                    .id("bottomAnchor")
                }
                .onChange(of: viewModel.messages.count) { _ in
                    withAnimation {
                        proxy.scrollTo("bottomAnchor", anchor: .bottom)
                    }
                }
            }
            .onTapGesture {
                UIApplication.shared.sendAction(
                    #selector(UIResponder.resignFirstResponder),
                    to: nil, from: nil, for: nil
                )
            }
            
            // ── Input Bar ──
            VStack(spacing: 0) {
                Divider()
                HStack(alignment: .bottom, spacing: 12) {
                    TextField("Message...", text: $viewModel.messageText, axis: .vertical)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(20)
                        .lineLimit(1...5)
                    
                    Button(action: { viewModel.sendMessage() }) {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(viewModel.messageText.isEmpty ? .gray : .blue)
                    }
                    .disabled(viewModel.messageText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                .padding(12)
                .background(Color(UIColor.systemBackground))
            }
        }
        .navigationTitle(userName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MessageBubble: View {
    let message: ChatMessage
    var body: some View {
        HStack {
            if message.isSender { Spacer() }
            Text(message.text)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(message.isSender ? Color.blue : Color(UIColor.secondarySystemBackground))
                .foregroundColor(message.isSender ? .white : .primary)
                .cornerRadius(20)
            if !message.isSender { Spacer() }
        }
    }
}
