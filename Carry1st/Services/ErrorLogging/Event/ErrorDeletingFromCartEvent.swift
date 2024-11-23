//
//  ErrorDeletingFromCartEvent.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

struct ErrorDeletingFromCartEvent: ErrorEvent {
    let message: String = "Error deleting item from cart"
    let level: ErrorLevel = .error
    
    let item: CartItem
    
    var userInfo: [String: Any]? {
        [
            "price": item.price,
            "id": item.id,
            "product_name": item.name
        ]
    }
}
