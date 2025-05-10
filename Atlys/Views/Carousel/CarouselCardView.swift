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

    var body: some View {
        let offset = config.calculateOffset(dynamicPosition, itemWidth: itemWidth)

        return Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: itemWidth, height: itemHeight)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(radius: scale == config.activeScale ? 8 : 4)
            .scaleEffect(scale)
            .frame(width: geometrySize.width, height: itemHeight, alignment: .center)
            .offset(x: offset)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: dynamicPosition)
    }
}
