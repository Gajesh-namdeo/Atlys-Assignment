//
//  ContentView.swift
//  Atlys
//
//  Created by Gajesh on 08/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var bottomItems: [String] = []
    @State private var topItems: [String] = []

    private let itemLimit = ItemLimits.maxItems

    var body: some View {
        Spacer()
        VStack(spacing: 16) {
            Spacer()

            ItemStackView(items: topItems)

            CarouselView(images: ["dubai", "indonesia", "malaysia"])
                .background(Color.white)

            ItemControlBar(
                itemType: .bottom,
                items: $bottomItems,
                oppositeItems: $topItems
            )

            ItemControlBar(
                itemType: .top,
                items: $topItems,
                oppositeItems: $bottomItems
            )

            ItemStackView(items: bottomItems)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    ContentView()
}
