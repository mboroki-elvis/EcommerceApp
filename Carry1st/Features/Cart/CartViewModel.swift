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

    func addToCart(
        item: Product,
        datasource: CartDatasourceProtocol,
        eventLogger: AnalyticsServiceProtocol,
        errorLogger: ErrorLoggingServiceProtocol,
        context: ModelContext,
        snackBarState: SnackbarState
    ) {
        defer { fetchCart(datasource: datasource, errorLogger: errorLogger, context: context) }
        do {
            try datasource.addToCart(item: CartItem(product: item), context: context)
            snackBarState.show(title: "Added", description: item.description)
            eventLogger.track(event: AddToCartEvent(product: item))
        } catch {
            apiError = error as? LocalizedError
            errorLogger.log(event: APIErrorEvent(error: error))
        }
    }

    func removeFromCart(
        item: CartItem,
        datasource: CartDatasourceProtocol,
        eventLogging: AnalyticsServiceProtocol,
        errorLogging: ErrorLoggingServiceProtocol,
        context: ModelContext
    ) {
        defer { fetchCart(datasource: datasource, errorLogger: errorLogging, context: context) }
        do {
            try datasource.removeFromCart(item: item, context: context)
            eventLogging.track(event: RemoveFromCartEvent(item: item))
        } catch {
            apiError = error as? LocalizedError
            errorLogging.log(event: APIErrorEvent(error: error))
        }
    }

    func fetchCart(datasource: CartDatasourceProtocol, errorLogger: ErrorLoggingServiceProtocol, context: ModelContext) {
        do {
            cart = try datasource.fetchCart(context: context)
        } catch {
            apiError = error as? LocalizedError
            errorLogger.log(event: APIErrorEvent(error: error))
        }
    }

    func resetError() {
        apiError = nil
    }
}
