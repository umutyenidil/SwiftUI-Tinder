//
//  CardStackView.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 13.09.2024.
//

import SwiftUI

struct CardStackView: View {
    @EnvironmentObject var matchManager: MatchManager
    
    @State private var showMatchView = false
    
    @StateObject var viewModel = CardStackViewModel(service: CardService())
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 16) {
                    ZStack {
                        ForEach(viewModel.cardModels) { card in
                            CardView(parentViewModel: viewModel, model: card)
                        }
                    }
                    .onChange(of: viewModel.cardModels) { oldValue, newValue in
                        print("test")
                    }
                    
                    if !viewModel.cardModels.isEmpty {
                        SwipeActionButtonsView(viewModel: viewModel)
                    }
                    
                }
                .blur(radius: showMatchView ? 20 : 0)
                
                if showMatchView {
                    UserMatchView(show: $showMatchView)
                }
            }
            .animation(.easeInOut, value: showMatchView)
            .onReceive(matchManager.$matchedUser, perform: { user in
                showMatchView = user != nil
            })
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(.tinderLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                }
            }
        }
    }
}

#Preview {
    CardStackView()
        .environmentObject(MatchManager())
}
