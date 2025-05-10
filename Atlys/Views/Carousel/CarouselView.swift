import SwiftUI

struct CarouselView: View {

    let images: [String]
    private let aspectRatio: CGFloat

    @State private var currentIndex: Int
    @State private var dragOffset: CGFloat = 0

    private let itemWidthPercentage: CGFloat = 0.8
    private let adjacentCardOffsetPercentage: CGFloat = 0.9
    private let activeScale: CGFloat = 1.0
    private let inactiveScale: CGFloat = 0.85

    init(images: [String], aspectRatio: CGFloat = 1.0) {
        self.images = images
        self.aspectRatio = aspectRatio
        self._currentIndex = State(initialValue: images.count / 2)
    }

    var body: some View {
        VStack {
            GeometryReader { geometry in
                CarouselStackView(
                    images: images,
                    currentIndex: $currentIndex,
                    dragOffset: $dragOffset,
                    aspectRatio: aspectRatio,
                    geometrySize: geometry.size,
                    config: .init(
                        itemWidthPercentage: itemWidthPercentage,
                        adjacentCardOffsetPercentage: adjacentCardOffsetPercentage,
                        activeScale: activeScale,
                        inactiveScale: inactiveScale
                    )
                )
            }
            .aspectRatio(aspectRatio, contentMode: .fit)
            .frame(maxWidth: .infinity)

            CarouselIndicators(
                count: images.count,
                currentPage: currentPageDuringDrag,
                dragOffset: dragOffset
            )
            .padding(.top, -40)
        }
    }

    private var currentPageDuringDrag: Int {
        let itemWidth = UIScreen.main.bounds.width * itemWidthPercentage
        let dragIndexOffset = Int((dragOffset / (itemWidth * adjacentCardOffsetPercentage)).rounded())
        return max(0, min(images.count - 1, currentIndex - dragIndexOffset))
    }
}



struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleImages = ["dubai", "indonesia", "malaysia"]
        
        VStack(spacing: 20) {
            CarouselView(images: sampleImages)
        }
        .background(Color.white)
        .previewLayout(.sizeThatFits)
    }
}
