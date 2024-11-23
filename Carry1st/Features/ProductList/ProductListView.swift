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
            if viewModel.products.isEmpty {
                VStack {
                    Spacer()
                    ProgressView().controlSize(.extraLarge).tint(.accent)
                    Spacer()
                }
            } else {
                List(viewModel.products) { product in
                    ProductRow(product: product)
                        .onTapGesture {
                            router.push(.details(product))
                        }
                }
                .listSectionSpacing(0)
                .listRowBackground(Color.container)
            }
        }
        .navigationTitle(Text(with: .ourProducts))
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: viewModel.fetchProducts)
    }
}
