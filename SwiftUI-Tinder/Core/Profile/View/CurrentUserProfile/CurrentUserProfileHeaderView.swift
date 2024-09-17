//
//  CurrentUserProfileHeaderView.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 16.09.2024.
//

import SwiftUI
import Kingfisher

struct CurrentUserProfileHeaderView: View {
    let user: UserModel
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                KFImage(URL(string: user.profileImageUrls[0]))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .background {
                        Circle()
                            .fill(Color(.systemGray6))
                            .frame(width: 128, height: 128)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                
                Image(systemName: "pencil")
                    .imageScale(.small)
                    .foregroundColor(.gray)
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 32, height: 32)
                    }
                    .offset(x: -8, y: 10)
            }
            
            Text("\(firstName), \(user.age)")
                .font(.title2)
                .fontWeight(.light)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .frame(height: 240)
    }
}

private extension CurrentUserProfileHeaderView {
    var firstName: String {
        return String(user.fullname.split(separator: " ")[0])
    }
}

#Preview {
    CurrentUserProfileHeaderView(user: MockData.users[0])
}
