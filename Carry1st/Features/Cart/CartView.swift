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

    var body: some View {
        ContainerView(error: viewModel.apiError, onDismissError: {
            viewModel.resetError()
        }, content: {
            List {
                ForEach(viewModel.cart) { product in
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
                }.onDelete { set in
                    set.forEach { index in
                        viewModel.removeFromCart(item: viewModel.cart[index])
                    }
                }
            }
            .listSectionSpacing(0)
            .listRowBackground(Color.container)
        })
        .onAppear {
            viewModel.fetchCart()
        }
        .navigationTitle(Text(with: .cart))
    }
}
