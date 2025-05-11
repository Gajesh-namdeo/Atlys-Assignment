//
//  ImageViewModel.swift
//  Atlys
//
//  Created by Gajesh on 10/05/25.
//

import Foundation

class ImageViewModel: ObservableObject {
    @Published var images: [String] = [] // List of image URLs
    
    private let fileName = "image.json" // Local JSON file
    
    init() {
        loadImages()
    }
    
    func loadImages() {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            print("Unable to find JSON file.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(ImageData.self, from: data)
            self.images = decodedData.images
        } catch {
            print("Error loading or decoding JSON: \(error)")
        }
    }
}
