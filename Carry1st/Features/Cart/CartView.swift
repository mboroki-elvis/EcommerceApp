//
//  CartView.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import SwiftUI
import SwiftData

struct CartView: View {
    @Environment(CartViewModel.self) private var viewModel
    @Query private var items: [CartItem]

    var body: some View {
        List {
            ForEach(items) { product in
                HStack {
                    Text(product.name)
                    Spacer()
                    Button(action: {
                        viewModel.removeFromCart(item: product)
                    }) {
                        Image(systemName: "trash")
                    }
                    .buttonStyle(.borderless)
                }
            }
        }
        .navigationTitle(LocalizableKeys.cart.rawValue)
    }
}
