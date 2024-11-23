//
//  CartViewModel.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import Foundation
import Observation
import SwiftData

@Observable
class CartViewModel {
    private(set) var apiError: LocalizedError?
    private(set) var cart: [CartItem] = []
    @ObservationIgnored @Inject private var context: ModelContext
    @ObservationIgnored @Inject private var cartDataSource: CartDatasourceProtocol

    func addToCart(item: Product) {
        defer { fetchCart() }
        do {
            try cartDataSource.addToCart(item: CartItem(product: item), context: context)
        } catch {
            apiError = error as? LocalizedError
        }
    }

    func removeFromCart(item: CartItem) {
        defer { fetchCart() }
        do {
            try cartDataSource.removeFromCart(item: item, context: context)
        } catch {
            apiError = error as? LocalizedError
        }
    }

    func fetchCart() {
        do {
            cart = try cartDataSource.fetchCart(context: context)
        } catch {
            apiError = error as? LocalizedError
        }
    }

    func resetError() {
        apiError = nil
    }
}
