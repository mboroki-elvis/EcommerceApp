//
//  RemoveFromCartEvent.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

struct RemoveFromCartEvent: AnalyticsEvent {
    let name: String = "remove_from_cart"

    let item: CartItem
    
    var parameters: [String: Any]? {
        [
            "price": item.price,
            "id": item.id,
            "product_name": item.name
        ]
    }
}
