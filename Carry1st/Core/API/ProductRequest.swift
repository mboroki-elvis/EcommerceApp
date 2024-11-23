//
//  ProductRequest.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import Foundation

struct ProductRequest: APIRequest {
    typealias ResponseType = [Product]
    var endpoint: String { APIPaths.productBundles.api }
    var method: HTTPMethod { .get }
    var headers: [String: String] = [:]
}
