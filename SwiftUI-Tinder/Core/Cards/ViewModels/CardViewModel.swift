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
    
    @Published var mockImages = [
        "https://images.pexels.com/photos/1170986/pexels-photo-1170986.jpeg",
        "https://images.pexels.com/photos/57416/cat-sweet-kitty-animals-57416.jpeg",
        "https://images.pexels.com/photos/1741205/pexels-photo-1741205.jpeg"
    ]
}
