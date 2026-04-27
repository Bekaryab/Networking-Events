//
//  ProfilePageView.swift
//  networking&Events
//
//  Created by bekarys abiev on 21.03.2026.
//

import Foundation
import FirebaseAuth
import UIKit
import SwiftUI
import Combine
import PhotosUI
class ProfilePageViewModel: ObservableObject{
    @Published var items: [EventItem] = []
    @Published var profilePhoto: PhotosPickerItem? = nil
    @Published var profileImage: Data? = nil
    @Published private var animateIcon = true
    @Published var showingAlert: Bool = false
    @Published private var isDraging = false
    @AppStorage("userFirstName") var Name1: String = ""
    @AppStorage("userLastName") var SurName1: String = ""
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    private let profileManager = ProfileManager()
    var currentUserUid: String{
        Auth.auth().currentUser?.uid ?? ""
    }
    
    func loadProfileImage(){
        if let data = profileManager.loadProfileImage(uid: currentUserUid){
            self.profileImage = data
        }
        else{
            self.profileImage = nil
        }
    }
    
    func onChange(){
        Task{
            if let data = try? await profilePhoto?.loadTransferable(type: Data.self) {
                self.profileImage = data
                self.profileManager.saveProfileImage(data: data, uid: self.currentUserUid)
            }
        }
    }
}
