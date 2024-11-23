//
//  MockProductCartVMTests.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 24/11/2024.
//

@testable import Carry1st
import Testing
import XCTest
import SwiftData

class MockProductCartVMTests {
    var viewModel: CartViewModel!

    @MainActor
    init() async throws {
        // Initialize mocks

        // Set up Swinject container with mock dependencies
        var sharedModelContainer: ModelContainer = {
            let schema = Schema([CartItem.self])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()
        let container = SwinjectContainer.shared
        container.register(SnackbarState.self) {
            SnackbarState()
        }
        container.register(CartDatasourceProtocol.self) {
            MockCartDatasource()
        }
        container.register(AnalyticsServiceProtocol.self) {
            MockAnalyticsService()
        }
        container.register(ErrorLoggingServiceProtocol.self) {
            MockErrorLoggingService()
        }
        let context = sharedModelContainer.mainContext
        container.register(ModelContext.self) {
            context
        }

        // Instantiate the ViewModel
        viewModel = CartViewModel()
    }

    deinit {
        viewModel = nil
    }

    @Test func addToCart() async throws {
        viewModel.addToCart(item: MockProductService.productsToReturn[0])
        #expect(viewModel.cart.count > 0)
        #expect(viewModel.apiError == nil)
    }
    
    @Test func removeFromCart() async throws {
        viewModel.addToCart(item: MockProductService.productsToReturn[0])
        viewModel.removeFromCart(item: viewModel.cart[0])
        #expect(viewModel.cart.isEmpty)
        #expect(viewModel.apiError == nil)
    }
}
