//
//  SearchPage.swift
//  networking&Events
//
//  Created by bekarys abiev on 05.03.2026.
//

import SwiftUI

struct SearchPageView: View {
    @StateObject private var viewModel = SearchPageViewModel()
    @EnvironmentObject var eventManager:  EventManager
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(viewModel.getSearchResults(from: eventManager.events), id: \.self){ name in
                        NavigationLink(destination: InformationOfEventsView(event: name)){
                            
                            if let data = name.photoData, let uiImage = UIImage(data: data){
                                VStack{
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 190, height: 190)
                                        .clipped()
                                        .cornerRadius(10)
                                    Text(name.title1 ?? "No title")
                                }
                            }
                            
                            else {
                                Rectangle()
                                    .frame(width: 190, height: 190)
                                    .foregroundStyle(Color.blue)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            
            }
        }
        
        .searchable(text: $viewModel.searchText)
        
    }
    
}

#Preview {
    SearchPageView()
}
