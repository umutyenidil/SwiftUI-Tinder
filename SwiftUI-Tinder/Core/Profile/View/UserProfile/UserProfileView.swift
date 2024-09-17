//
//  UserProfileView.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 16.09.2024.
//

import SwiftUI
import Kingfisher

struct UserProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var currentImageIndex: Int = 0
    
    
    let user: UserModel
    
    var body: some View {
        VStack {
            HStack {
                Text(user.fullname)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("\(user.age)")
                    .font(.title2)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.down.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(.pink)
                }
            }
            .padding(.horizontal)
            
            ScrollView {
                VStack {
                    ZStack(alignment: .top) {
                        KFImage(URL(string: user.profileImageUrls[currentImageIndex]))
                            .resizable()
                            .scaledToFill()
                            .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                            .overlay {
                                ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                            }
                        
                        CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount)
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("About me")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .font(.subheadline)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Essentials")
                    
                    HStack {
                        Image(systemName: "person")
                        
                        Text("Woman")
                        
                        Spacer()
                    }
                    
                    HStack {
                        Image(systemName: "arrow.down.forward.and.arrow.up.backward.circle")
                        
                        Text("Straight")
                        
                        Spacer()
                    }
                    
                    HStack {
                        Image(systemName: "book")
                        
                        Text("Actress")
                        
                        Spacer()
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .font(.subheadline)
                .fontWeight(.semibold)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

private extension UserProfileView {
    var imageCount: Int {
        return user.profileImageUrls.count
    }
}

#Preview {
    UserProfileView(user: MockData.users[0])
}
