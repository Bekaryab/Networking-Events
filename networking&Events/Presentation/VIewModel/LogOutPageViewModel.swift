//
//  LogOutPageViewModel.swift
//  networking&Events
//
//  Created by bekarys abiev on 21.03.2026.
//

import Foundation
import FirebaseAuth
import Combine
import SwiftUI
import UIKit
class LogOutPageViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isPresented: Bool = false
    @Published var isRegistered: Bool = false
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    func registerButton(){
        isRegistered = true
    }
    func logIn(){
        guard !email.isEmpty, !password.isEmpty else {
            return print("Please fill in all fields")
        }
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            }else{
                self.isPresented = true
                self.isLoggedIn = true
            }
            return
        }
    }
}
