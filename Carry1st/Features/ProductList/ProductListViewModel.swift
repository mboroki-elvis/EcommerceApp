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
    @ObservationIgnored @Inject private var errorLogging: ErrorLoggingServiceProtocol

    func fetchProducts() async {
        do {
            self.products = try await productService.fetchProducts()
        } catch {
            apiError = error as? LocalizedError
            errorLogging.log(event: APIErrorEvent(error: error))
        }
    }
    
    func resetError() {
        apiError = nil
    }
}
