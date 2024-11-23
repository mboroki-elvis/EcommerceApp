//
//  ProductDetailView.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(CartViewModel.self) private var viewModel

    let product: Product

    var body: some View {
        List {
            // Display product image, name, price, and description
            Text(product.name)
                .font(.title)
            Text(product.description)
                .font(.body)
            Spacer()
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                Button(action: {
                    viewModel.addToCart(product: product)
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
        .padding()
    }
}
