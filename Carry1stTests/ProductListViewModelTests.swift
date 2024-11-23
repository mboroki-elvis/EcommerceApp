//
//  ProductListViewModelTests.swift
//  Carry1stTests
//
//  Created by Elvis Mwenda on 22/11/2024.
//

@testable import Carry1st
import Testing
import XCTest

class ProductListViewModelTests {
    var viewModel: ProductListViewModel!

    init() async throws {
        // Initialize mocks

        // Set up Swinject container with mock dependencies
        let container = SwinjectContainer.shared
        container.register(ProductServiceProtocol.self) {
            MockProductService()
        }
        container.register(ErrorLoggingServiceProtocol.self) {
            MockErrorLoggingService()
        }

        // Instantiate the ViewModel
        viewModel = ProductListViewModel()
    }

    deinit {
        viewModel = nil
    }

    @Test func fetchProducts() async throws {
        try #require(await viewModel.fetchProducts())
        #expect(viewModel.products.count > 0)
        #expect(viewModel.apiError == nil)
    }
    
    @Test func fetchProductsError() async throws {
        try #require(await viewModel.fetchProducts())
        #expect(viewModel.apiError != nil)
    }
}
