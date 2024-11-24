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
    var productService: MockProductService!
    var errorLogger: MockErrorLoggingService!
    init() async throws {
        productService = MockProductService()
        errorLogger = MockErrorLoggingService()
        viewModel = ProductListViewModel()
    }

    deinit {
        viewModel = nil
    }

    @Test func fetchProducts() async throws {
        productService.shouldThrowError = false
        try #require(await viewModel.fetchProducts(service: productService, error: errorLogger))
        #expect(viewModel.products.count > 0)
        #expect(viewModel.apiError == nil)
    }
    
    @Test func fetchProductsError() async throws {
        productService.shouldThrowError = true
        try #require(await viewModel.fetchProducts(service: productService, error: errorLogger))
        #expect(viewModel.apiError != nil)
    }
}
