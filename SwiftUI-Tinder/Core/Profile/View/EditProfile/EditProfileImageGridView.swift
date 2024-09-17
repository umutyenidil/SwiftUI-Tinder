//
//  EditProfileImageGridView.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 16.09.2024.
//

import SwiftUI
import Kingfisher

struct EditProfileImageGridView: View {
    let user: UserModel
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(0 ..< 6) { index in
                if index < user.profileImageUrls.count {
                    KFImage(URL(string: user.profileImageUrls[index]))
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageWidth, height: imageHeight)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    ZStack(alignment: .bottomTrailing) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.secondarySystemBackground))
                            .frame(width: imageWidth, height: imageHeight)
                        
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                            .foregroundStyle(.pink)
                            .offset(x: 4, y: 4)
                    }
                }
            }
        }
    }
}

private extension EditProfileImageGridView {
    private var columns: [GridItem] {
        [.init(.flexible()),
        .init(.flexible()),
        .init(.flexible())]
    }
    
    var imageWidth: CGFloat {
        return 110
    }
    
    var imageHeight: CGFloat {
        return 160
    }
}

#Preview {
    EditProfileImageGridView(user: MockData.users[0])
}
