//
//  ProductServiceProtocol.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 26/11/2024.
//

import Foundation

protocol ProductServiceProtocol {
    /// Fetches a list of products from the API
    ///
    /// - Returns: An array of `Product` or throws an error.
    func fetchProducts() async throws -> [Product]
}
