//
//  CartDatasource.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import Foundation
import SwiftData

protocol CartDatasourceProtocol {
    func addToCart(item: CartItem, context: ModelContext) throws
    func removeFromCart(item: CartItem, context: ModelContext) throws
    func contextHas(item: CartItem, context: ModelContext) throws -> Bool
    func fetchCart(context: ModelContext) throws -> [CartItem]
}

struct CartDatasource: CartDatasourceProtocol {
    func addToCart(item: CartItem, context: ModelContext) throws {
        let exist = try contextHas(item: item, context: context)
        guard !exist else { throw CartDatasourceError.saveError(item.name) }
        context.insert(item)
    }

    func removeFromCart(item: CartItem, context: ModelContext) throws {
        let exist = try contextHas(item: item, context: context)
        guard exist else { throw CartDatasourceError.deleteError(item.name) }
        context.delete(item)
    }

    func contextHas(item: CartItem, context: ModelContext) throws -> Bool {
        let id = item.id
        let predicate = #Predicate<CartItem> { $0.id == id }
        let fetchedMovie = try context.fetch(FetchDescriptor<CartItem>(predicate: predicate, sortBy: [SortDescriptor(\.id)]))
        return !fetchedMovie.isEmpty
    }

    func fetchCart(context: ModelContext) throws -> [CartItem] {
        try context.fetch(FetchDescriptor<CartItem>(sortBy: [SortDescriptor(\.id)]))
    }
}

extension CartDatasource {
    enum CartDatasourceError: LocalizedError {
        case deleteError(String)
        case saveError(String)
        case empty
        var errorDescription: String? {
            switch self {
            case .deleteError(let name):
                return "Could not delete \(name) from cart"
            case .saveError(let name):
                return "Could not save \(name) to cart"
            case .empty:
                return "No item found in card"
            }
        }
    }
}
