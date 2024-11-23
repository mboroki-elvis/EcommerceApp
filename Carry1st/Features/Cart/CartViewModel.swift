//
//  CartViewModel.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import Observation
import SwiftData

@Observable
class CartViewModel {
    var items: [Product] = []
    private var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }

    func addToCart(product: Product) {
        items.append(product)
    }

    func removeFromCart(product: Product) {
        items.removeAll { $0.id == product.id }
    }

    var itemCount: Int {
        items.count
    }
}
