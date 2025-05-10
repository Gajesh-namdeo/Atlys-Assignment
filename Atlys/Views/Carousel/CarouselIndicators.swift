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

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<count, id: \.self) { index in
                Circle()
                    .fill(index == currentPage ? Color.black : Color.gray.opacity(0.5))
                    .frame(width: 8, height: 8)
            }
        }
        .animation(.easeInOut, value: dragOffset)
    }
}
