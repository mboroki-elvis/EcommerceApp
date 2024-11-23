//
//  MockCartDatasource.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

@testable import Carry1st
import Foundation
import SwiftData

class MockCartDatasource: CartDatasourceProtocol {
    var cartItems: [CartItem] = []
    var shouldThrowError: Bool = false

    func addToCart(item: CartItem, context: ModelContext) throws {
        if shouldThrowError {
            throw MockError.testError
        }
        cartItems.removeAll()
        cartItems.append(item)
    }

    func removeFromCart(item: CartItem, context: ModelContext) throws {
        if shouldThrowError {
            throw MockError.testError
        }
        cartItems.removeAll { $0 == item }
    }

    func fetchCart(context: ModelContext) throws -> [CartItem] {
        if shouldThrowError {
            throw MockError.testError
        }
        return cartItems
    }

    func contextHas(item: Carry1st.CartItem, context: ModelContext) throws -> Bool {
        if shouldThrowError { throw MockError.testError }
        return true
    }
}

class MockAnalyticsService: AnalyticsServiceProtocol {
    var trackedEvents: [AnalyticsEvent] = []

    func track(event: AnalyticsEvent) {
        trackedEvents.append(event)
    }
}
