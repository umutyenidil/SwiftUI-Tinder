//
//  CardView.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 12.09.2024.
//

import SwiftUI
import Kingfisher

struct CardView: View {
    @StateObject private var viewModel = CardViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                KFImage(URL(string: viewModel.mockImages[viewModel.currentImageIndex]))
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                    .overlay {
                        ImageScrollingOverlay(currentImageIndex: $viewModel.currentImageIndex, imageCount: viewModel.mockImages.count)
                    }
                
                CardImageIndicatorView(currentImageIndex: viewModel.currentImageIndex, imageCount: viewModel.mockImages.count)
                
                SwipeActionIndicatorView(xOffset: $viewModel.xOffset)
                    .padding(.top, 20)
            }
            
            UserInfoView()
        }
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: viewModel.xOffset)
        .rotationEffect(.degrees(viewModel.degrees))
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
        .animation(.snappy, value: viewModel.xOffset)
    }
}

private extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        viewModel.xOffset = value.translation.width
        viewModel.degrees = Double(value.translation.width / 25)
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutOff) {
            viewModel.xOffset = 0
            viewModel.degrees = 0
        }
    }
}

#Preview {
    CardView()
}
