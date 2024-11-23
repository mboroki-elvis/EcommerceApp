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
    @ObservationIgnored @Inject private var context: ModelContext
    @ObservationIgnored @Inject private var cartDataSource: CartDatasourceProtocol

    var itemCount: Int {
        do {
            return try cartDataSource.fetchAllFavorites(context: context).count
        } catch {
            return .zero
        }
    }

    func addToCart(item: Product) {
        do {
            try cartDataSource.addToCart(item: CartItem(product: item), context: context)
        } catch {}
    }

    func removeFromCart(item: CartItem) {
        do {
            try cartDataSource.removeFromCart(item: item, context: context)
        } catch {}
    }
}
