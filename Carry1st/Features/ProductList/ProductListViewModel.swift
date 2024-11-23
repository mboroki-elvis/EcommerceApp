//
//  ProductListViewModel.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import Observation
import Swinject
import Foundation

@Observable
final class ProductListViewModel {
    private(set) var apiError: LocalizedError?
    private(set) var products: [Product] = []
    @ObservationIgnored @Inject private var productService: ProductServiceProtocol

    func fetchProducts() {
        Task {
            do {
                self.products = try await productService.fetchProducts()
            } catch {
                apiError = error as? LocalizedError
            }
        }
    }
    
    func resetError() {
        apiError = nil
    }
}
