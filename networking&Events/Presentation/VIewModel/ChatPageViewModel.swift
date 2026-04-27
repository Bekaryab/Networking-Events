//
//  ChatPageViewModel.swift
//  networking&Events
//
//  Created by bekarys abiev on 20.03.2026.
//

//  ChatPageViewModel.swift

import Foundation
import Combine
import FirebaseFirestore

struct User: Identifiable, Hashable {
    let id: String
    let name: String
}

@MainActor
class ChatPageViewModel: ObservableObject {
    @Published var personSearch: String = ""
    @Published var searchResults: [User] = []
    @Published var recentChats: [User] = []
    
    private let db = Firestore.firestore()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $personSearch
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink { [weak self] searchText in
                self?.searchUsers(query: searchText)
            }
            .store(in: &cancellables)
        
        loadRecentChats()
    }
    
    private func searchUsers(query: String) {
        guard !query.isEmpty else {
            self.searchResults = []
            return
        }
        db.collection("users")
            .whereField("name", isGreaterThanOrEqualTo: query)
            .whereField("name", isLessThan: query + "\u{f8ff}")
            .getDocuments { [weak self] snapshot, error in
                guard let docs = snapshot?.documents else { return }
                self?.searchResults = docs.compactMap { doc -> User? in
                    let name = doc.data()["name"] as? String ?? "Unknown"
                    return User(id: doc.documentID, name: name)
                }
            }
    }
    
    func loadRecentChats() {
        let saved = ChatStorageService.shared.loadChats()
        self.recentChats = saved.compactMap { dict in
            guard let id = dict["id"], let name = dict["name"] else { return nil }
            return User(id: id, name: name)
        }
    }
}
