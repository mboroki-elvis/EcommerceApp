//
//  AddToCartEvent.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

struct AddToCartEvent: AnalyticsEvent {
    let name: String = "add_to_cart"

    let product: Product
    
    var parameters: [String: Any]? {
        [
            "price": product.price,
            "id": product.id,
            "product_name": product.name
        ]
    }
}
