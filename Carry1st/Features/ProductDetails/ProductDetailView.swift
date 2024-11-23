//
//  ProductDetailView.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(CartViewModel.self) private var viewModel
    @Environment(SnackbarState.self) private var snackBarState

    let product: Product
    
    var body: some View {
        ContainerView(error: viewModel.apiError, onDismissError: {
            viewModel.resetError()
        }, content: {
            List {
                ProductRow(product: product)
                Text(product.description)
                    .font(.body)
            }
            .listSectionSpacing(0)
            .safeAreaInset(edge: .bottom) {
                HStack {
                    Button(action: {
                        viewModel.addToCart(item: product)
                    }) {
                        Text(with: .addToCart)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    Button(action: {
                        // Implement buy now functionality
                    }) {
                        Text(with: .buyNow)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                }
            }
            .padding(.horizontal)
        })
        .snackBar(isDisplaying: .init(get: { snackBarState.isDisplaying }, set: { snackBarState.isDisplaying = $0 }), title: "Added to Cart", description: product.name)
    }
}
