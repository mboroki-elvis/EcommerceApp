//
//  Product.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let name: String
    let price: Double
    let description: String
    let logoURL: URL
}

