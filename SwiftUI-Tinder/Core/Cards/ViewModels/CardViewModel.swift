//
//  CardViewModel.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 12.09.2024.
//

import Foundation

class CardViewModel: ObservableObject {
    @Published var xOffset: CGFloat = 0.0
    @Published var degrees: Double = 0.0
    @Published var currentImageIndex: Int = 0
}
