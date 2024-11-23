//
//  APIPaths.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import Foundation

enum APIPaths {
    case productBundles
    var api: String {
        switch self {
        case .productBundles:
            return "mock-product-api/productBundles"
        }
    }
}
