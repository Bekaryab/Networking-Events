//
//  BookmarksPage.swift
//  networking&Events
//
//  Created by bekarys abiev on 25.02.2026.
//

import SwiftUI

struct BookmarksPageView: View {
    @Binding var items: [EventItem]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    BookmarksPageView(items: .constant([]))
}
