//
//  CartView.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import SwiftUI

struct CartView: View {
    @Environment(CartViewModel.self) private var viewModel

    var body: some View {
        List {
            ForEach(viewModel.items) { product in
                HStack {
                    Text(product.name)
                    Spacer()
                    Button(action: {
                        viewModel.removeFromCart(product: product)
                    }) {
                        Image(systemName: "trash")
                    }
                    .buttonStyle(.borderless)
                }
            }
        }
        .navigationTitle("Cart")
    }
}
