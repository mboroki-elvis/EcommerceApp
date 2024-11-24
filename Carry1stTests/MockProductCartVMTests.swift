//
//  MockProductCartVMTests.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 24/11/2024.
//

@testable import Carry1st
import SwiftData
import Testing

class MockProductCartVMTests {
    private var viewModel: CartViewModel!
    private var datasource: MockCartDatasource!
    private var eventLogging: MockAnalyticsService!
    private var errorLogging: MockErrorLoggingService!
    static let sharedModelContainer: ModelContainer = {
        let schema = Schema([CartItem.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    init() {
        // Instantiate the ViewModel
        viewModel = CartViewModel()
        datasource = MockCartDatasource()
        eventLogging = MockAnalyticsService()
        errorLogging = MockErrorLoggingService()
    }

    deinit {
        viewModel = nil
        datasource = nil
        eventLogging = nil
        errorLogging = nil
    }

    @MainActor
    @Test func addToCart() async throws {
        viewModel.addToCart(
            item: MockProductService.productsToReturn[0],
            datasource: datasource,
            eventLogger: eventLogging,
            errorLogger: errorLogging,
            context: Self.sharedModelContainer.mainContext,
            snackBarState: .init()
        )
        #expect(viewModel.cart.count > 0)
        #expect(viewModel.apiError == nil)
    }

    @MainActor
    @Test func removeFromCart() async throws {
        viewModel.addToCart(
            item: MockProductService.productsToReturn[0],
            datasource: datasource,
            eventLogger: eventLogging,
            errorLogger: errorLogging,
            context: Self.sharedModelContainer.mainContext,
            snackBarState: .init()
        )
        viewModel.removeFromCart(
            item: viewModel.cart[0],
            datasource: datasource,
            eventLogging: eventLogging,
            errorLogging: errorLogging,
            context: Self.sharedModelContainer.mainContext
        )
        #expect(viewModel.cart.isEmpty)
        #expect(viewModel.apiError == nil)
    }
}
