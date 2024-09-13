//
//  CardStackView.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 13.09.2024.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardStackViewModel(service: CardService())
    
    var body: some View {
        ZStack {
            ForEach(viewModel.cardModels) { card in
                CardView(parentViewModel: viewModel, model: card)
            }
        }
        .onChange(of: viewModel.cardModels) { oldValue, newValue in
            print("test")
        }
    }
}

#Preview {
    CardStackView()
}
