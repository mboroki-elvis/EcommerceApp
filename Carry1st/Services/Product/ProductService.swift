//
//  ProductServiceProtocol.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import Foundation

protocol ProductServiceProtocol {
    /// Fetches a list of products from the API
    ///
    /// - Returns: An array of `Product` or throws an error.
    func fetchProducts() async throws -> [Product]
}

struct ProductService: ProductServiceProtocol {
    private let client = NetworkClientImpl()

    /// Fetches a list of products from the API using async/await
    ///
    /// - Returns: An array of `Product` or throws an error if the operation fails.
    func fetchProducts() async throws -> [Product] {
        do {
            let request = ProductRequest()
            return try await request.response(client)
        } catch APIException.unknownError {
            throw ProductsError.unknownError
        } catch {
            throw ProductsError.error(error)
        }
    }
}

private extension ProductService {
    /// Enumeration defining errors specific to the movie API.
    enum ProductsError: LocalizedError {
        case badRequest
        case unknownError
        case error(Error)
        var errorDescription: String? {
            switch self {
            case .badRequest:
                return "Bad Request Check again"
            case .unknownError:
                return "An unkown error has occured, please try again"
            case .error:
                return "There was an error on our end, try again later."
            }
        }
    }
}
