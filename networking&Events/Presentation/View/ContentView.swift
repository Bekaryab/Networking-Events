//
//  ContentView.swift
//  networking&Events
//
//  Created by bekarys abiev on 11.02.2026.
//

import SwiftUI
import FirebaseAuth
struct ContentView: View {
    //Біз мұнда ContentViewModel шақырып жатырмыз соның ішінен аламыз керек заттарды 
    @StateObject private var eventManager = EventManager()
    @State var selectedTab: Int = 0
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            TabView(selection: $selectedTab){
                ItemPageView(selectedTab: $selectedTab)
                    
                    .tabItem{
                        Image(systemName: "plus.circle")
                        Text("Create Event")
                    }
                    .tag(0)
                ProfilePageView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(1)
                SearchPageView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .tag(2)
                ChatPageView()
                    .tabItem {
                        Image(systemName: "person.3")
                        Text("Chat")
                    }
                    .tag(3)
            }
        }
        .environmentObject(eventManager)
    }
}

#Preview {
    ContentView()
}
