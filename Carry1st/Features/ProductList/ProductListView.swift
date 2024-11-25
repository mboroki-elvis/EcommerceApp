//
//  ProductListView.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import SwiftUI

struct ProductListView: View {
    @Environment(AppRouter.self) private var router: AppRouter
    @Environment(\.productService) private var productService
    @Environment(\.analyticsService) private var analyticsService
    @Environment(\.errorLogger) private var errorLogging

    @State private var viewModel = ProductListViewModel()

    var body: some View {
        ContainerView(error: viewModel.apiError) {
            viewModel.resetError()
        } content: {
            if viewModel.products.isEmpty {
                loadingView.frame(maxWidth: .infinity)
            } else {
                productView
            }
        }
        .navigationTitle(Text(with: .ourProducts))
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetchProducts(service: productService, error: errorLogging)
        }
        .refreshable {
            await viewModel.fetchProducts(service: productService, error: errorLogging)
        }
        .onAppear {
            analyticsService.track(event: LoadScreenEvent(screenName: String(describing: Self.self)))
        }
    }

    private var productView: some View {
        List(viewModel.products) { product in
            ProductRow(product: product)
                .onTapGesture {
                    router.push(.details(product))
                }
                .accessibilityIdentifier("productRow_\(product.id)")
        }
        .accessibilityIdentifier("productList")
        .listSectionSpacing(0)
        .listRowBackground(Color.container)
    }

    private var loadingView: some View {
        VStack {
            Spacer()
            ProgressView()
                .controlSize(.extraLarge)
                .tint(.accent)
                .accessibilityIdentifier("loadingIndicator")
            Spacer()
        }
    }
}
