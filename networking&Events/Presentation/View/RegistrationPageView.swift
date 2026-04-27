//
//  RegistrationPage.swift
//  networking&Events
//
//  Created by bekarys abiev on 12.02.2026.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
struct RegistrationPage: View {
    @StateObject private var viewModel = RegistrationPageViewModel()
    
    var body: some View {
            // 1. Негізгі контейнер ретінде ScrollView-ді аламыз
            ScrollView {
                
                VStack(spacing: 15) {
                    
                    CustomTextField(placeholder: "Email or Phone number", text: $viewModel.email)
                    CustomTextField(placeholder: "Password", text: $viewModel.Password)
                    CustomTextField(placeholder: "Name", text: $viewModel.Name)
                    CustomTextField(placeholder: "SurName", text: $viewModel.SurName)
                    
                    Button(action: {
                        viewModel.chek()
                    }) {
                        Text("Registration")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundStyle(.white)
                            .clipShape(Capsule())
                    }
                    
                    CustomButtonStyle(text: "Log in", action: {
                        viewModel.isLogIn = true
                    })
                }
                .padding(.horizontal, 20)
                .padding(.top, 200) // Жоғарыдан кішкене орын тастау үшін
            }
            // 2. Бүкіл фонды .background ішіне саламыз
            .background(
                ZStack {
                    LinearGradient(
                        colors: [Color(hex: "#4F46E5"), Color(hex: "#7C3AED"), Color(hex: "#A855F7")],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    
                    // ✅ Blob 1
                    Circle()
                        .fill(Color.white.opacity(0.08))
                        .frame(width: 320)
                        .blur(radius: 2)
                        .offset(x: -110, y: -260)
                    
                    // ✅ Blob 2
                    Circle()
                        .fill(Color(hex: "#FF6584").opacity(0.18))
                        .frame(width: 120)
                        .offset(x: 130, y: -180)
                }
                .ignoresSafeArea() // Экранды толық жабу үшін осы жерге қоямыз
            )
            .fullScreenCover(isPresented: $viewModel.isCreated) {
                ContentView()
            }
            .fullScreenCover(isPresented: $viewModel.isLogIn){
                LogOutPageView()
            }
        }
    
}




#Preview {
    RegistrationPage()
}
