//
//  ContentView.swift
//  Atlys
//
//  Created by Gajesh on 08/05/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ImageViewModel()
    @State private var bottomItems: [String] = []
    @State private var topItems: [String] = []

    private let itemLimit = ItemLimits.maxItems
    
    // MARK: - Static images for carousel
    private var images = ["dubai", "malaysia", "indonesia"]
    
    var body: some View {
        Spacer()
        VStack(spacing: 16) {
            Spacer()
            
            ItemStackView(items: topItems)

            // MARK: - Carousel View (Static Images)
            CarouselView(images: self.images)
                .background(Color.white)

            // MARK: - Carousel View (Dynamic Images - Uncomment to use API data)
            // Uncomment to use images fetched from ViewModel (API or local JSON)
            // CarouselView(images: viewModel.images)
            //     .background(Color.white)

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

        // MARK: - Image Loading (API or Local JSON - Uncomment to use)
        // If you want to load the image via API or from URL, uncomment below
        // .onAppear {
        //     // Trigger image loading when the view appears
        //     viewModel.loadImages() // Call to load images from the ViewModel
        // }
    }
}

#Preview {
    ContentView()
}
