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
            // MARK: - Loop through all images
            ForEach(0..<images.count, id: \.self) { index in
                // Calculate item width and height based on aspect ratio and geometry
                let itemWidth = geometrySize.width * config.itemWidthPercentage
                let itemHeight = itemWidth / aspectRatio

                // Calculate dynamic position based on drag offset and current index
                let dynamicPosition = config.calculateDynamicPosition(
                    for: index,
                    currentIndex: currentIndex,
                    dragOffset: dragOffset,
                    itemWidth: itemWidth
                )

                // Calculate scale for the current item based on its dynamic position
                let scale = config.scaleForDynamicPosition(dynamicPosition)

                // Set the Z-index to control layer stacking order based on dynamic position
                let zIndex = -abs(dynamicPosition)

                // MARK: - Carousel card view for each image
                CarouselCardView(
                    imageName: images[index],
                    itemWidth: itemWidth,
                    itemHeight: itemHeight,
                    dynamicPosition: dynamicPosition,
                    scale: scale,
                    config: config,
                    geometrySize: geometrySize
                )
                .zIndex(zIndex) // Ensure the right stacking order for images
            }
        }
        // MARK: - Handle Drag Gesture
        .gesture(
            DragGesture()
                .onChanged { value in
                    dragOffset = value.translation.width // Update drag offset during drag
                }
                .onEnded { value in
                    // Predict where the drag will end
                    let predictedEndOffset = value.predictedEndTranslation.width
                    let threshold = geometrySize.width * 0.15 // Define a threshold for swipe action

                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        // Determine if the drag offset crosses the threshold to change current index
                        if predictedEndOffset < -threshold && currentIndex < images.count - 1 {
                            currentIndex += 1 // Move to next image
                        } else if predictedEndOffset > threshold && currentIndex > 0 {
                            currentIndex -= 1 // Move to previous image
                        }
                        dragOffset = 0 // Reset drag offset after the gesture ends
                    }
                }
        )
    }
}
