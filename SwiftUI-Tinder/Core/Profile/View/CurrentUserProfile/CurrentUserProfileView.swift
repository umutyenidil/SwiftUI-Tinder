//
//  CurrentUserProfileView.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 16.09.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var showEditProfile = false
    
    let user: UserModel

    var body: some View {
        NavigationStack {
            List {
                CurrentUserProfileHeaderView(user: user)
                    .onTapGesture {
                        showEditProfile.toggle()
                    }
                
                Section("Account Information") {
                    HStack {
                        Text("Name")
                        
                        Spacer()
                        
                        Text(user.fullname)
                    }
                    
                    HStack {
                        Text("Email")
                        
                        Spacer()
                        
                        Text("test@test.com")
                    }
                }
                
                Section("Legal") {
                    Text("Terms of Service")
                }
                
                Section {
                    Button("Logout") {
                        
                    }
                }
                .foregroundStyle(.red)
                
                Section {
                    Button("Delete Account") {
                        
                    }
                }
                .foregroundStyle(.red)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile) {
                EditProfileView(user: user)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[0])
}
