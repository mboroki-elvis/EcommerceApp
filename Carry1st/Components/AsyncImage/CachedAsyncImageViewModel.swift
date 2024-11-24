//
//  CachedAsyncImageViewModel.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import Observation
import SwiftUI

@MainActor
@Observable
class CachedAsyncImageViewModel {

    var uiImage: UIImage?
    var isLoading: Bool = false

    func loadImage(from url: URL?, cache: ImageCache) async {
        guard !self.isLoading, let url = url else { return }
        self.isLoading = true

        // Check cache for the image
        if let cachedImage = cache.getImage(for: url) {
            self.uiImage = cachedImage
            self.isLoading = false
        } else {
            // Download the image
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let image = UIImage(data: data) {
                    cache.saveImage(image, for: url)
                    self.uiImage = image
                }
            } catch {
                print("Failed to load image: \(error)")
            }
            self.isLoading = false
        }
    }
}
