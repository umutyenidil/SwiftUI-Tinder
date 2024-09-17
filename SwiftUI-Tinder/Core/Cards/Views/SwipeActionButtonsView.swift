//
//  SwipeActionButtonsView.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 16.09.2024.
//

import SwiftUI

struct SwipeActionButtonsView: View {
    @ObservedObject var viewModel: CardStackViewModel
    
    var body: some View {
        HStack(spacing: 32) {
            Button {
                viewModel.buttonSwipeAction = .reject
            } label: {
                Image(systemName: "xmark")
                    .fontWeight(.heavy)
                    .foregroundStyle(.red)
                    .background(
                        Circle()
                            .fill()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.white)
                            .shadow(radius: 6)
                    )
            }
            .frame(width: 48, height: 48)
            
            Button {
                viewModel.buttonSwipeAction = .like
            } label: {
                Image(systemName: "heart.fill")
                    .fontWeight(.heavy)
                    .foregroundStyle(.green)
                    .background(
                        Circle()
                            .fill()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.white)
                            .shadow(radius: 6)
                    )
            }
            .frame(width: 48, height: 48)
        }
    }
}

#Preview {
    SwipeActionButtonsView(viewModel: CardStackViewModel(service: CardService()))
}
