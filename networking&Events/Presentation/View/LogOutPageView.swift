//
//  LogOutPage.swift
//  networking&Events
//
//  Created by bekarys abiev on 19.02.2026.
//

import SwiftUI
import FirebaseAuth
struct LogOutPageView: View {
    @StateObject private var viewModel = LogOutPageViewModel()
    
    
    var body: some View {
        VStack{
            Custom(palace: "Email", text: $viewModel.email)
            Custom(palace: "Password", text: $viewModel.password)
            
            CustomButtonStyle(text: "Log in", action: {
                viewModel.logIn()
            })
            CustomButtonStyle(text: "Register", action: {
                viewModel.registerButton()
            })
        }
        .padding()
        .fullScreenCover(isPresented: $viewModel.isPresented){
            ContentView()
        }
        .fullScreenCover(isPresented: $viewModel.isRegistered){
            RegistrationPage()
        }
        
    }
}


#Preview {
    LogOutPageView()
}
