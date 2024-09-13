//
//  CardService.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 13.09.2024.
//

import Foundation


struct CardService {
    func fetchCardModels() async throws -> [CardModel] {
        let users = MockData.users
        
        return users.map({ CardModel(user: $0) })
    }
}
