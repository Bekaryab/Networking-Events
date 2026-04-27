//
//  networking_EventsApp.swift
//  networking&Events
//
//  Created by bekarys abiev on 11.02.2026.
//

import SwiftUI
import FirebaseCore
@main
struct networkingEventsAppView: App {
    @AppStorage ("isLoggedIn") var isLoggedIn: Bool = false
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        
        WindowGroup {
            if isLoggedIn{
                ContentView()
            }
            else{
                LogOutPageView()
            }
        }
    }
}
