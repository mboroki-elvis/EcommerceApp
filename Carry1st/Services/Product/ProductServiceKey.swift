//
//  ProductServiceKey.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 24/11/2024.
//

import SwiftUI

struct ProductServiceKey: EnvironmentKey {
    // you can also set the real user service as the default value
    static let defaultValue: any ProductServiceProtocol = ProductService()
}

extension EnvironmentValues {
    var productService: any ProductServiceProtocol {
        get { self[ProductServiceKey.self] }
        set { self[ProductServiceKey.self] = newValue }
    }
}
