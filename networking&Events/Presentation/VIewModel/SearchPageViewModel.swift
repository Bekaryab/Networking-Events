//
//  SearchPageViewModel.swift
//  networking&Events
//
//  Created by bekarys abiev on 22.03.2026.
//

import Foundation
import SwiftUI
import UIKit
import Combine
class SearchPageViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    func getSearchResults(from allItems: [EventItem]) -> [EventItem] {
        if searchText.isEmpty {
            return allItems
        } else {
            return allItems.filter { ($0.title1 ?? "No event").contains(searchText) }
        }
    }
}
