//
//  UserInfoView.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 12.09.2024.
//

import SwiftUI

struct UserInfoView: View {
    let user: UserModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(user.fullname)
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("\(user.age)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    print("show profile")
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                }
            }
            
            Text("Test | People")
                .font(.subheadline)
                .lineLimit(2)
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    UserInfoView(user: MockData.users[0])
}
