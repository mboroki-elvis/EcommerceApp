//
//  CartItem.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import Foundation
import SwiftData

@Model
final class CartItem: Identifiable {
    @Attribute(.unique) var id: Int
    var imageLocation: String
    var name: String
    var itemDescription: String
    var price: Double
    var quantity: Double
    var status: String
    var currencyCode: String
    var currencySymbol: String

    init(id: Int, imageLocation: String, name: String, itemDescription: String, price: Double, quantity: Double, status: String, currencyCode: String, currencySymbol: String) {
        self.id = id
        self.imageLocation = imageLocation
        self.name = name
        self.itemDescription = itemDescription
        self.price = price
        self.quantity = quantity
        self.status = status
        self.currencyCode = currencyCode
        self.currencySymbol = currencySymbol
    }
}
