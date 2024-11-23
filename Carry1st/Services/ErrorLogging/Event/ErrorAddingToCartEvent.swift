//
//  ErrorAddingToCartEvent.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

struct ErrorAddingToCartEvent: ErrorEvent {
    let message: String = "Error adding to cart"
    let level: ErrorLevel = .error
    
    let product: Product
    
    var userInfo: [String: Any]? {
        [
            "price": product.price,
            "id": product.id,
            "product_name": product.name
        ]
    }
}
