//
//  CardModel.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 13.09.2024.
//

import Foundation

struct CardModel {
    let user: UserModel
}

extension CardModel: Identifiable, Hashable {
    var id: String { return user.id }
}
