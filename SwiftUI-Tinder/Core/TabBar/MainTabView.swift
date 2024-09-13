//
//  MainTabBar.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 12.09.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("Swipig View")
                .tabItem {
                    Image(systemName: "flame")
                }
                .tag(0)
            
            Text("Search View")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            
            Text("Inbox View")
                .tabItem {
                    Image(systemName: "bubble")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .tag(2)
            
            Text("ProfileView")
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(3)
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
}
