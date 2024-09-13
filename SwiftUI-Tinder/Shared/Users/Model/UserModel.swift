//
//  UserModel.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 13.09.2024.
//

import Foundation

struct UserModel: Identifiable, Hashable {
    let id: String
    let fullname: String
    var age: Int
    var profileImageUrls: [String]
}
