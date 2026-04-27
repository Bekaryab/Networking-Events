//
//  ItemPageViewModel.swift
//  networking&Events
//
//  Created by bekarys abiev on 20.03.2026.
//

import Foundation
import PhotosUI
import SwiftUI
import Combine
import UIKit
@MainActor
class ItemPageViewModel: ObservableObject {
    @Published var item: [EventItem] = []
    @Published var selectedPhoto: PhotosPickerItem? = nil{
        didSet{
            saveSelectedItem(photo: selectedPhoto)
        }
    }
    
    @Published var itemImage: Data? = nil
    @Published var tittle: String = ""
    @Published var location: String = ""
    @Published var date: Date = Date()
    @Published var guests: String = ""
    @Published var description: String = ""
    
    
    
    
    func saveSelectedItem(photo: PhotosPickerItem?){
        Task{
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self){
                itemImage = data
            }
        }
    }
    
    
    
    
}
