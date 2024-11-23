//
//  Product.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import Foundation

struct Product: Codable, Identifiable, Hashable {
    let id: Int
    var imageLocation: String
    var name: String
    var price: Double
    var quantity: Double
    var status: String
    var currencyCode: String
    var currencySymbol: String
    var description: String
}
