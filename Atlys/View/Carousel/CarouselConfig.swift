//
//  CarouselConfig.swift
//  Atlys
//
//  Created by Gajesh on 09/05/25.
//
import SwiftUI

struct CarouselConfig {
    let itemWidthPercentage: CGFloat
    let adjacentCardOffsetPercentage: CGFloat
    let activeScale: CGFloat
    let inactiveScale: CGFloat

    // MARK: - Calculate Dynamic Position
    // Computes the dynamic position of an item during a drag, considering the index, currentIndex, drag offset, and item width.
    func calculateDynamicPosition(for index: Int, currentIndex: Int, dragOffset: CGFloat, itemWidth: CGFloat) -> CGFloat {
        let basePosition = CGFloat(index - currentIndex) // Base position based on the difference between index and current index
        let dragAdjustment = dragOffset / (itemWidth * adjacentCardOffsetPercentage) // Adjustment based on drag offset
        return basePosition + dragAdjustment // Return adjusted dynamic position
    }

    // MARK: - Calculate Offset
    // Returns the offset based on the dynamic position, which is used to place the item within the carousel.
    func calculateOffset(_ dynamicPosition: CGFloat, itemWidth: CGFloat) -> CGFloat {
        return dynamicPosition * itemWidth * adjacentCardOffsetPercentage
    }

    // MARK: - Calculate Scale for Dynamic Position
    // Calculates the scale of an item based on its dynamic position (how far it is from the center).
    func scaleForDynamicPosition(_ dynamicPosition: CGFloat) -> CGFloat {
        let distance = abs(dynamicPosition) // Get the absolute distance from the center
        let scaleFactorMultiplier: CGFloat = 1.2 // Multiplier to adjust the scaling behavior
        let scale = activeScale - (distance * scaleFactorMultiplier * (activeScale - inactiveScale)) // Calculate scale
        return max(inactiveScale, min(activeScale, scale)) // Ensure scale is within bounds
    }
}
