//
//  CardView.swift
//  SwiftUI-Tinder
//
//  Created by Umut Yenidil on 12.09.2024.
//

import SwiftUI
import Kingfisher

struct CardView: View {
    @EnvironmentObject var matchManager: MatchManager
    
    @ObservedObject var parentViewModel: CardStackViewModel
    let model: CardModel
    
    @StateObject private var viewModel = CardViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                KFImage(URL(string: user.profileImageUrls[viewModel.currentImageIndex]))
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                    .overlay {
                        ImageScrollingOverlay(currentImageIndex: $viewModel.currentImageIndex, imageCount: imageCount)
                    }
                
                CardImageIndicatorView(currentImageIndex: viewModel.currentImageIndex, imageCount: imageCount)
                
                SwipeActionIndicatorView(xOffset: $viewModel.xOffset)
                    .padding(.top, 20)
            }
            
            UserInfoView(showProfileSheet: $viewModel.showProfileSheet, user: user)
        }
        .fullScreenCover(isPresented: $viewModel.showProfileSheet) {
            UserProfileView(user: user)
        }
        .onReceive(parentViewModel.$buttonSwipeAction, perform: { action in
            onReceiveSwipeAction(action)
        })
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
    var user: UserModel {
        return model.user
    }
    
    var imageCount: Int {
        return user.profileImageUrls.count;
    }
}

private extension CardView {
    func onReceiveSwipeAction(_ action: SwipeAction?) {
        guard let action else { return }
        
        let topCard = parentViewModel.cardModels.last
        
        if topCard == model {
            switch action {
            case .reject:
                swipeLeft()
            case .like:
                swipeRight()
            }
        }
    }
    
    func returnToCenter() {
        viewModel.xOffset = 0
        viewModel.degrees = 0
    }
    
    func swipeRight() {
        withAnimation {
            viewModel.xOffset = 500
            viewModel.degrees = 12
        } completion: {
            parentViewModel.removeCard(model)
            matchManager.checkForMatch(withUser: user)
        }
    }
    
    func swipeLeft() {
        withAnimation {
            viewModel.xOffset = -500
            viewModel.degrees = -12
        } completion: {
            parentViewModel.removeCard(model)
        }
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
            returnToCenter()
            return
        }
        
        if width >= SizeConstants.screenCutOff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}

#Preview {
    CardView(parentViewModel: CardStackViewModel(service: CardService()), model: CardModel(user: MockData.users[0]))
}
