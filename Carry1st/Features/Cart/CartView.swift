//
//  CartView.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import SwiftData
import SwiftUI

struct CartView: View {
    @Environment(CartViewModel.self) private var viewModel
    @Inject private var eventLogging: AnalyticsServiceProtocol

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
            eventLogging.track(event: LoadScreenEvent(screenName: String(describing: Self.self)))
        }
        .navigationTitle(Text(with: .cart))
    }
}
