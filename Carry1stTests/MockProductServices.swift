//
//  MockProductServices.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import Foundation
@testable import Carry1st

class MockProductService: ProductServiceProtocol {
    static  var productsToReturn: [Product] = [
        .init(id: 0, imageLocation: "", name: "", price: .zero, quantity: .zero, status: "", currencyCode: "", currencySymbol: "", description: "")
    ]
    static var shouldThrowError: Bool = false

    func fetchProducts() async throws -> [Product] {
        if Self.shouldThrowError {
            throw MockError.testError
        }
        return Self.productsToReturn
    }
}

class MockErrorLoggingService: ErrorLoggingServiceProtocol {
    var loggedEvents: [ErrorEvent] = []

    func log(event: ErrorEvent) {
        loggedEvents.append(event)
    }
}

enum MockError: LocalizedError, Equatable {
    case testError

    var errorDescription: String? {
        return "Test Error"
    }
}
