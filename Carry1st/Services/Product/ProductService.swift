//
//  ProductService.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import Foundation

struct ProductService: ProductServiceProtocol {
    private let client: any NetworkClient
    private let cacheService: any CacheServiceProtocol<Product>
    static let cacheKey = "cachedProducts"

    init(
        client: any NetworkClient = NetworkClientImplementation(),
        cacheService: any CacheServiceProtocol<Product> = CacheService(with: Self.cacheKey)
    ) {
        self.client = client
        self.cacheService = cacheService
    }

    /// Fetches a list of products from the cache or API using async/await
    ///
    /// - Returns: An array of `Product` or throws an error if the operation fails.
    func fetchProducts() async throws -> [Product] {
        // Attempt to retrieve from cache
        if let cachedProducts = cacheService.getItem(forKey: Self.cacheKey) {
            return cachedProducts
        }

        // If not cached, fetch from network
        do {
            let request = ProductRequest()
            let products = try await request.response(client)
            // Cache the fetched products
            cacheService.setItem(products, forKey: Self.cacheKey)
            return products
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
