//
//  RegistrationPageViewModel.swift
//  networking&Events
//
//  Created by bekarys abiev on 22.03.2026.
//

import Foundation
import UIKit
import Combine
import FirebaseAuth
import SwiftUI
import FirebaseFirestore
class RegistrationPageViewModel: ObservableObject{
    @Published var email       = ""
    @Published var Password     = ""
    @Published var Name         = ""
    @Published var SurName      = ""
    @Published var isCreated = false
    @Published var isLogIn = false
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("userFirstName") var Name1: String = ""
    @AppStorage("userLastName") var SurName1: String = ""
    let db = Firestore.firestore()
    
    func chek(){
        guard !email.isEmpty, !Password.isEmpty, !Name.isEmpty, !SurName.isEmpty else {
            print("Password or email not writen")
            return
        }
        Auth.auth().createUser(withEmail: email, password: Password){ authResult, error in
            if let error = error{
                print("\(error.localizedDescription)")
            }
            else {
                print("User Created")
                self.isCreated = true
                self.isLoggedIn = true
                self.Name1 = self.Name
                self.SurName1 = self.SurName
                let userId = authResult?.user.uid ?? ""
                self.db.collection("users").document(userId).setData([
                    "name": self.Name1,
                    "lastName": self.SurName1,
                    "id": userId,
                ])
                {error in
                    if let error = error{
                        print("error \(error.localizedDescription)")
                    }
                    else{
                        print("Success")
                    }
                }
            }

    }
    
    }
}
