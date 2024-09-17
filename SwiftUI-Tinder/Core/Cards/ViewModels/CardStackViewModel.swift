//
//  CardStackViewModle.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 13.09.2024.
//

import Foundation

@MainActor
class CardStackViewModel: ObservableObject {
    @Published var cardModels = [CardModel]()
    @Published var buttonSwipeAction: SwipeAction?
    
    private let service: CardService
    init(service: CardService) {
        self.service = service
        Task { await fetchCardModels() }
    }
    
    func fetchCardModels() async {
        do {
            self.cardModels = try await service.fetchCardModels()
        } catch {
            print("DEBUG:: Failed to fetch cards with error: \(error.localizedDescription)")
        }
    }
    
    func removeCard(_ card: CardModel) {
//        Task {
//            try await Task.sleep(nanoseconds: 500_000_000)
//            guard let index = cardModels.firstIndex(where: { $0.id == card.id }) else { return }
//            cardModels.remove(at: index)
//        }
        
        guard let index = cardModels.firstIndex(where: { $0.id == card.id }) else { return }
        cardModels.remove(at: index)
    }
}
