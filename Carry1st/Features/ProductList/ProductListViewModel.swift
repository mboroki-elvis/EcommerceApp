//
//  ProductListViewModel.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import Observation
import Foundation

@Observable
final class ProductListViewModel {
    private(set) var apiError: LocalizedError?
    private(set) var products: [Product] = []

    func fetchProducts(service: ProductServiceProtocol, error logging: ErrorLoggingServiceProtocol) async {
        do {
            self.products = try await service.fetchProducts()
        } catch {
            apiError = error as? LocalizedError
            logging.log(event: APIErrorEvent(error: error))
        }
    }
    
    func resetError() {
        apiError = nil
    }
}
