//
//  SwiftUI_TinderApp.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 12.09.2024.
//

import SwiftUI

@main
struct SwiftUI_TinderApp: App {
    @StateObject var matchManager = MatchManager()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(matchManager)
        }
    }
}
