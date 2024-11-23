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
        ContainerView {
            viewModel.resetError()
        } content: {
            List(viewModel.products) { product in
                ProductRow(product: product)
                    .onTapGesture {
                        router.push(.details(product))
                    }
            }
            .onAppear(perform: viewModel.fetchProducts)
        }
    }
}
