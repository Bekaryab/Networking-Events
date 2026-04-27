//
//  ProfilePage.swift
//  networking&Events
//
//  Created by bekarys abiev on 18.02.2026.
//

import SwiftUI
import FirebaseAuth
import PhotosUI
struct ProfilePageView: View {
    @StateObject private var viewModel = ProfilePageViewModel()
    @State private var animateIcon = true
    @State private var isDraging = false
    @State private var showSettings: Bool = false
    ///Picker
    @State private var selectedPicker = 0
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center, spacing: 15){
                HStack{
                    Spacer()
                    Button(action: {
                        showSettings = true
                    })
                    {
                        Image(systemName: "line.3.horizontal")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    .fullScreenCover(isPresented: $showSettings){
                        MainSettingsPageView()
                    }
                }
                .padding(.horizontal)
                PhotosPicker(selection: $viewModel.profilePhoto, matching: .images){
                    if let photo = viewModel.profileImage, let uiImage = UIImage(data: photo){
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    }
                    else{
                        Image(systemName: "person.badge.plus")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .symbolEffect(.bounce, value: animateIcon)
                    }
                    
                }
                
                Text("Abiyev Bekarys")
                    .font(.headline)
                HStack(spacing: 20){
                    VStack{
                        Text("Followers")
                        Text("100")
                    }
                    Divider()
                        .frame(height: 40)
                    VStack{
                        Text("Followings")
                        Text("10")
                    }
                }
                Spacer()
                
                Divider()
                Picker("",selection: $selectedPicker){
                    Text("My Events").tag(0)
                    Text("Likes").tag(1)
                    Text("Saves").tag(2)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                ScrollView{
                    switch selectedPicker{
                    case 0:
                        MyEventsPageView()
                    case 1:
                        LikesViewPage()
                    case 2:
                        SavesPageView()
                    default:
                        Text("")
                    }
                }
                //Spacer()
                .padding(.top, 5)
                
                
            }
        }
        .padding(.top, 30)
    }
}


#Preview {
    ProfilePageView()
}
