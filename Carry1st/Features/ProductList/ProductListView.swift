//
//  ProductListView.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import SwiftUI

struct ProductListView: View {
    @Environment(AppRouter.self) private var router: AppRouter
    @State private var viewModel: ProductListViewModel = .init()

    var body: some View {
        ContainerView(error: viewModel.apiError) {
            viewModel.resetError()
        } content: {
            List(viewModel.products) { product in
                ProductRow(product: product)
                    .onTapGesture {
                        router.push(.details(product))
                    }
            }
            .listSectionSpacing(0)
            .onAppear(perform: viewModel.fetchProducts)
        }
    }
}
