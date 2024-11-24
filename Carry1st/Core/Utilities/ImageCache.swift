//
//  ImageCache.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import SwiftUI
import Combine
import Observation

@Observable
class ImageCache {
    private let cache = NSCache<NSURL, UIImage>()

    init() {}

    func getImage(for url: URL) -> UIImage? {
        return cache.object(forKey: url as NSURL)
    }

    func saveImage(_ image: UIImage, for url: URL) {
        cache.setObject(image, forKey: url as NSURL)
    }
}
