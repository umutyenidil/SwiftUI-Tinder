//
//  MatchManager.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 17.09.2024.
//

import Foundation

@MainActor
class MatchManager: ObservableObject {
    @Published var matchedUser: UserModel?
    
    func checkForMatch(withUser user: UserModel) {
        let didMatch = Bool.random()
        
        if didMatch {
            matchedUser = user
        }
    }
}
