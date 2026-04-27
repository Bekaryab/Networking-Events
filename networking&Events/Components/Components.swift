//
//  Components.swift
//  networking&Events
//
//  Created by bekarys abiev on 19.02.2026.
//

import SwiftUI

//LogOutPage Button Component also ProfilePageComponents
struct CustomButtonStyle: View{
    var text: String
    var action: () -> Void
    var body: some View{
        Button(action: action){
            if text == "Log in" || text == "Register"{
                Text(text)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
            }
            else if text == "Save"{
                Button(action: action){
                    Text(text)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                }
            }
            else {
                Button(action: action){
                    Text(text)
                        .background(Color.clear)
                        .foregroundStyle(.red)
                        .clipShape(Capsule())
                }
            }
            
        }
    }
}
    //LogOutPage TextFild Components
    struct Custom: View{
        var palace: String
        @Binding var text: String
        var body: some View{
            TextField(palace, text: $text)
                .padding()
                .overlay(
                    Capsule()
                        .stroke(Color.gray, style: StrokeStyle(lineWidth: 1))
                )
        }
    }
    
    //This is RegistrationPage TEXTFILDE design
    struct CustomTextField: View {
        var placeholder: String
        @Binding var text: String
        var body: some View{
            VStack(alignment: .leading, spacing: 5){
                TextField(placeholder, text: $text)
                    .padding()
                    .background(Color.white) // Осы маңызды: Ақ фон қосу
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            
        }
    }

