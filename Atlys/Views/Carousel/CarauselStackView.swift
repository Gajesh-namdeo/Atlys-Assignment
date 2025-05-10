//
//  CarauselStackView.swift
//  Atlys
//
//  Created by Gajesh on 09/05/25.
//
import SwiftUI

struct CarouselStackView: View {
    
    let images: [String]
    @Binding var currentIndex: Int
    @Binding var dragOffset: CGFloat

    let aspectRatio: CGFloat
    let geometrySize: CGSize
    let config: CarouselConfig

    var body: some View {
        ZStack {
            ForEach(0..<images.count, id: \.self) { index in
                let itemWidth = geometrySize.width * config.itemWidthPercentage
                let itemHeight = itemWidth / aspectRatio

                let dynamicPosition = config.calculateDynamicPosition(
                    for: index,
                    currentIndex: currentIndex,
                    dragOffset: dragOffset,
                    itemWidth: itemWidth
                )
                let scale = config.scaleForDynamicPosition(dynamicPosition)
                let zIndex = -abs(dynamicPosition)

                CarouselCardView(
                    imageName: images[index],
                    itemWidth: itemWidth,
                    itemHeight: itemHeight,
                    dynamicPosition: dynamicPosition,
                    scale: scale,
                    config: config,
                    geometrySize: geometrySize
                )
                .zIndex(zIndex)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    dragOffset = value.translation.width
                }
                .onEnded { value in
                    let predictedEndOffset = value.predictedEndTranslation.width
                    let threshold = geometrySize.width * 0.15
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        if predictedEndOffset < -threshold && currentIndex < images.count - 1 {
                            currentIndex += 1
                        } else if predictedEndOffset > threshold && currentIndex > 0 {
                            currentIndex -= 1
                        }
                        dragOffset = 0
                    }
                }
        )
    }
}
