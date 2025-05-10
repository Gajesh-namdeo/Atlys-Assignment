//
//  CarouselCardView.swift
//  Atlys
//
//  Created by Gajesh on 09/05/25.
//
import SwiftUI

struct CarouselCardView: View {
    let imageName: String
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    let dynamicPosition: CGFloat
    let scale: CGFloat
    let config: CarouselConfig
    let geometrySize: CGSize
    
    // A reusable image view modifier for both success and failure states
    private func imageView(image: Image) -> some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: itemWidth, height: itemHeight)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(radius: scale == config.activeScale ? 8 : 4)
            .scaleEffect(scale)
            .frame(width: geometrySize.width, height: itemHeight, alignment: .center)
            .offset(x: config.calculateOffset(dynamicPosition, itemWidth: itemWidth))
            .transition(.opacity.animation(.smooth))
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: dynamicPosition)
    }

    var body: some View {
        AsyncImage(url: URL(string: imageName)) { phase in
            switch phase {
            case .success(let image):
                imageView(image: image)
            case .failure, .empty:
                imageView(image: Image(imageName)) // Placeholder image in case of failure or empty state
            @unknown default:
                EmptyView()
            }
        }
    }
}
