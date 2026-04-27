import SwiftUI

struct MainSettingsPageView: View {
    @State private var showingAlert: Bool = false
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            List {
                
                // MARK: - Profile Section
                Section {
                    HStack(spacing: 15) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.blue)
                        
                        VStack(alignment: .leading) {
                            Text("Bekarys")
                                .font(.headline)
                            Text("бекарыс@email.com")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.vertical, 5)
                }
                
                // MARK: - Settings Section
                Section("Preferences") {
                    HStack {
                        Image(systemName: "bell.fill")
                            .foregroundStyle(.orange)
                        Text("Notifications")
                        Spacer()
                        Toggle("", isOn: .constant(true))
                            .labelsHidden()
                    }
                    
                    HStack {
                        Image(systemName: "moon.fill")
                            .foregroundStyle(.purple)
                        Text("Dark Mode")
                        Spacer()
                        Toggle("", isOn: .constant(false))
                            .labelsHidden()
                    }
                }
                
                // MARK: - Logout Section
                Section {
                    Button {
                        showingAlert = true
                    } label: {
                        HStack {
                            Spacer()
                            Text("Log Out")
                                .fontWeight(.semibold)
                                .foregroundStyle(.red)
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
        }
        
        // MARK: - Alert
        .alert("Are you sure?", isPresented: $showingAlert) {
            Button("Log Out", role: .destructive) {
                isLoggedIn = false
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("You will be logged out of your account.")
        }
    }
}

#Preview {
    MainSettingsPageView()
}
