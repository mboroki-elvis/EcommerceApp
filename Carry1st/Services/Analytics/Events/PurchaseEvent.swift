//
//  PurchaseEvent.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

struct PurchaseEvent: AnalyticsEvent {
    let name: String = "purchase_item"

    let product: Product
    
    var parameters: [String: Any]? {
        [
            "price": product.price,
            "id": product.id,
            "product_name": product.name
        ]
    }
}
