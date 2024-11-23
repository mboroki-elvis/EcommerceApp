//
//  Carry1stApp.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import SwiftUI
import SwiftData

@main
struct Carry1stApp: App {
    
    init () {
        let container = SwinjectContainer.shared
        container.register(ProductServiceProtocol.self) {
            ProductService()
        }
        container.registerSingleton(ImageCache.self) {
            ImageCache.shared
        }
    }
    var body: some Scene {
        WindowGroup {
        
        }
    }
}
