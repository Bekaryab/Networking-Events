//
//  EventManager.swift
//  NetworkingEventsApp
//
//  Data / Repositories папкасында тұрады
//

import Foundation
import FirebaseAuth
import Combine
class EventManager: ObservableObject {
    @Published var events: [EventItem] = []
    var currentUserUid: String {
        Auth.auth().currentUser?.uid ?? "guest"
    }
    init() {
        loadEvents()
    }
    func addEvent(event: EventItem) {
        events.append(event)
        saveEvents()
    }
    func saveEvents() {
        if let encoded = try? JSONEncoder().encode(events) {
            UserDefaults.standard.set(encoded, forKey: "events_\(currentUserUid)")
        }
    }
    func loadEvents() {
        if let data = UserDefaults.standard.data(forKey: "events_\(currentUserUid)") {
            if let decoded = try? JSONDecoder().decode([EventItem].self, from: data) {
                self.events = decoded
                return
            }
        }
        self.events = []
    }
}
