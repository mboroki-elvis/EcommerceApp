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
    private(set) var cart: [CartItem] = []
    private(set) var apiError: LocalizedError?

    @ObservationIgnored @Inject private var context: ModelContext
    @ObservationIgnored @Inject private var snackBarSate: SnackbarState
    @ObservationIgnored @Inject private var cartDataSource: CartDatasourceProtocol
    @ObservationIgnored @Inject private var eventLogging: AnalyticsServiceProtocol
    @ObservationIgnored @Inject private var errorLogging: ErrorLoggingServiceProtocol

    func addToCart(item: Product) {
        defer { fetchCart() }
        do {
            try cartDataSource.addToCart(item: CartItem(product: item), context: context)
            snackBarSate.show(title: "Added", description: item.description)
            eventLogging.track(event: AddToCartEvent(product: item))
        } catch {
            apiError = error as? LocalizedError
            errorLogging.log(event: APIErrorEvent(error: error))
        }
    }

    func removeFromCart(item: CartItem) {
        defer { fetchCart() }
        do {
            try cartDataSource.removeFromCart(item: item, context: context)
            eventLogging.track(event: RemoveFromCartEvent(item: item))
        } catch {
            apiError = error as? LocalizedError
            errorLogging.log(event: APIErrorEvent(error: error))
        }
    }

    func fetchCart() {
        do {
            cart = try cartDataSource.fetchCart(context: context)
        } catch {
            apiError = error as? LocalizedError
            errorLogging.log(event: APIErrorEvent(error: error))
        }
    }

    func resetError() {
        apiError = nil
    }
}
