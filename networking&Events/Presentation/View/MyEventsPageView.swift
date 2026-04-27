//
//  MyEventsPage.swift
//  networking&Events
//
//  Created by bekarys abiev on 25.02.2026.
//

import SwiftUI

struct MyEventsPageView: View {
    @EnvironmentObject var eventManager:  EventManager
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns){
                    
                    ForEach(eventManager.events) {event in
                        NavigationLink(destination: InformationOfEventsView(event: event)){
                            
                            if let data = event.photoData, let uiImage = UIImage(data: data){
                                VStack{
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 190, height: 190)
                                        .clipped()
                                        .cornerRadius(10)
                                    Text(event.title1 ?? "No title")
                                }
                            }
                            
                            else {
                                Rectangle()
                                    .frame(width: 190, height: 190)
                                    .foregroundStyle(Color.blue)
                                    .cornerRadius(10)
                            }
                        }
                        .contextMenu {
                            Button(role: .destructive) {
                                eventManager.events.removeAll { $0.id == event.id }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
                
            }
        }
            
        }
}

#Preview {
    MyEventsPageView()
}
