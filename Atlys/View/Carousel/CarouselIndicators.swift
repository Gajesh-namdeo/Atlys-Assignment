//
//  CarouselIndicators.swift
//  Atlys
//
//  Created by Gajesh on 09/05/25.
//
import SwiftUI

struct CarouselIndicators: View {
    let count: Int
    let currentPage: Int
    let dragOffset: CGFloat
    let geometrySize: CGSize

    var body: some View {
        let dotSize = geometrySize.width * 0.02 // 2% of width
        let spacing = geometrySize.width * 0.018 // 1.8% of width
        HStack(spacing: spacing) {
            ForEach(0..<count, id: \.self) { index in
                Circle()
                    .fill(index == currentPage ? Color.black : Color.gray.opacity(0.5))
                    .frame(width: dotSize, height: dotSize)
            }
        }
        .frame(width: geometrySize.width)
        .animation(.easeInOut, value: dragOffset)
    }
}

