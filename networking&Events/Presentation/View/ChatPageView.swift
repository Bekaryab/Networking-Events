//
//  ChatPage.swift
//  networking&Events
//
//  Created by bekarys abiev on 05.03.2026.
//

//  ChatPageView.swift

import SwiftUI

struct ChatPageView: View {
    @StateObject private var viewModel = ChatPageViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                // ── SEARCH RESULTS ──
                if !viewModel.personSearch.isEmpty {
                    Section(header: Text("Search Results")) {
                        if viewModel.searchResults.isEmpty {
                            Text("No users found")
                                .foregroundColor(.gray)
                        } else {
                            ForEach(viewModel.searchResults, id: \.self) { user in
                                NavigationLink {
                                    ChatRoomView(userId: user.id, userName: user.name)
                                } label: {
                                    ChatUserRow(name: user.name)
                                }
                            }
                        }
                    }
                }
                // ── RECENT CHATS ──
                else if !viewModel.recentChats.isEmpty {
                    Section(header: Text("Recent Chats")) {
                        ForEach(viewModel.recentChats, id: \.self) { user in
                            NavigationLink {
                                ChatRoomView(userId: user.id, userName: user.name)
                            } label: {
                                ChatUserRow(name: user.name)
                            }
                        }
                    }
                }
                // ── EMPTY STATE ──
                else {
                    VStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 48))
                            .foregroundColor(.gray.opacity(0.5))
                        Text("Search for someone to start chatting")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 60)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Messages")
            .searchable(text: $viewModel.personSearch, prompt: "Search people...")
            .onAppear {
                // Refresh recent chats every time we come back
                viewModel.loadRecentChats()
            }
        }
    }
}

struct ChatUserRow: View {
    let name: String
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 40))
                .foregroundColor(.blue)
            Text(name)
                .font(.system(size: 17, weight: .semibold))
            Spacer()
        }
        .padding(.vertical, 4)
    }
}
