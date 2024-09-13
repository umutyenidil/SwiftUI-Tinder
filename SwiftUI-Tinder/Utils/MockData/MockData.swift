//
//  MockData.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 13.09.2024.
//

import Foundation

struct MockData {
    static let users: [UserModel] = [
        UserModel(
            id: UUID().uuidString,
            fullname: "Alice Johnson",
            age: 25,
            profileImageUrls: [
                "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg",
                "https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg",
                "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg"
            ]
        ),
        UserModel(
            id: UUID().uuidString,
            fullname: "Bob Smith",
            age: 30,
            profileImageUrls: [
                "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg",
                "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg"
            ]
        ),
        UserModel(
            id: UUID().uuidString,
            fullname: "Claire Martinez",
            age: 28,
            profileImageUrls: [
                "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg",
                "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg",
                "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg"
            ]
        ),
        UserModel(
            id: UUID().uuidString,
            fullname: "David Lee",
            age: 27,
            profileImageUrls: [
                "https://images.pexels.com/photos/20787/pexels-photo.jpg",
                "https://images.pexels.com/photos/1382734/pexels-photo-1382734.jpeg"
            ]
        ),
        UserModel(
            id: UUID().uuidString,
            fullname: "Evelyn Brown",
            age: 24,
            profileImageUrls: [
                "https://images.pexels.com/photos/1831234/pexels-photo-1831234.jpeg",
                "https://images.pexels.com/photos/1832329/pexels-photo-1832329.jpeg",
                "https://images.pexels.com/photos/1484813/pexels-photo-1484813.jpeg"
            ]
        )
    ]
}
