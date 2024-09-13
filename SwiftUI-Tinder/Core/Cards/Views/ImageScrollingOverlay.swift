//
//  ImageScrollingOverlay.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 12.09.2024.
//

import SwiftUI

struct ImageScrollingOverlay: View {
    @Binding var currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .onTapGesture {
                    updateImageIndex(increment: false)
                }
            
            Rectangle()
                .onTapGesture {
                    updateImageIndex(increment: true)
                }
        }
        .foregroundStyle(.white.opacity(0.00000001))
    }
}

private extension ImageScrollingOverlay {
    func updateImageIndex(increment: Bool) {
        withAnimation(.snappy) {
            if increment {
                guard currentImageIndex < imageCount - 1 else { return }
                currentImageIndex += 1
            } else {
                guard currentImageIndex > 0 else { return }
                currentImageIndex -= 1
            }
        }
    }
}

#Preview {
    ImageScrollingOverlay(currentImageIndex: .constant(0), imageCount: 3)
}
