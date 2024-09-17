//
//  EditProfileVie.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 16.09.2024.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    let user: UserModel
    
    @State private var bio: String = ""
    @State private var occupation: String = "Programmer"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                EditProfileImageGridView(user: user)
                    .padding()
                
                VStack(spacing: 24) {
                    VStack(alignment: .leading) {
                        Text("ABOUT ME")
                            .font(.subheadline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.leading)
                        
                        TextField("Add your bio", text: $bio, axis: .vertical)
                            .padding()
                            .frame(height: 64, alignment: .top)
                            .background(Color(.secondarySystemBackground))
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("OCCUPATION")
                            .font(.subheadline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.leading)
                        
                        HStack {
                            Image(systemName: "book")
                            Text("Occupation")
                            
                            Spacer()
                            
                            Text(occupation)
                                .font(.footnote)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("GENDER")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)
                        
                        HStack {
                            Text("Man")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("SEXUAL ORIENTATION")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)
                        
                        HStack {
                            Text("Straight")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    EditProfileView(user: MockData.users[0])
}
