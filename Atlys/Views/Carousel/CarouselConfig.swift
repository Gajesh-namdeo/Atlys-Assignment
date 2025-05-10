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

    func calculateDynamicPosition(for index: Int, currentIndex: Int, dragOffset: CGFloat, itemWidth: CGFloat) -> CGFloat {
        let basePosition = CGFloat(index - currentIndex)
        let dragAdjustment = dragOffset / (itemWidth * adjacentCardOffsetPercentage)
        return basePosition + dragAdjustment
    }

    func calculateOffset(_ dynamicPosition: CGFloat, itemWidth: CGFloat) -> CGFloat {
        return dynamicPosition * itemWidth * adjacentCardOffsetPercentage
    }

    func scaleForDynamicPosition(_ dynamicPosition: CGFloat) -> CGFloat {
        let distance = abs(dynamicPosition)
        let scaleFactorMultiplier: CGFloat = 1.2
        let scale = activeScale - (distance * scaleFactorMultiplier * (activeScale - inactiveScale))
        return max(inactiveScale, min(activeScale, scale))
    }
}
