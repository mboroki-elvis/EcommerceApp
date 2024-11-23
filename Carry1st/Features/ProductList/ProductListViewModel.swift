//
//  ProductListViewModel.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import Observation
import Swinject

@Observable
final class ProductListViewModel {
    private(set) var products: [Product] = []
    @ObservationIgnored @Inject private var productService: ProductServiceProtocol

    init() {}

    func fetchProducts() {
        Task {
            do {
                let response = try await productService.fetchProducts()
            } catch {
                
            }
        }
    }
}
