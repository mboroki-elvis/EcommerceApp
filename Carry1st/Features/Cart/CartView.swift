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
    @Environment(SnackbarState.self) private var snackBarState
    @Environment(\.analyticsService) private var analyticsService
    @Environment(\.errorLogger) private var errorLogger
    @Environment(\.cartDatasource) private var cartDatasource
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ContainerView(error: viewModel.apiError, onDismissError: {
            viewModel.resetError()
        }, content: {
            List {
                ForEach(viewModel.cart) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Button(action: {
                            viewModel.removeFromCart(
                                item: item,
                                datasource: cartDatasource,
                                eventLogging: analyticsService,
                                errorLogging: errorLogger,
                                context: modelContext
                            )
                        }) {
                            Image(systemName: "trash")
                        }
                        .buttonStyle(.borderless)
                    }
                }.onDelete { set in
                    set.forEach { index in
                        viewModel.removeFromCart(
                            item: viewModel.cart[index],
                            datasource: cartDatasource,
                            eventLogging: analyticsService,
                            errorLogging: errorLogger,
                            context: modelContext
                        )
                    }
                }
            }
            .listSectionSpacing(0)
            .listRowBackground(Color.container)
        })
        .onAppear {
            viewModel.fetchCart(datasource: cartDatasource, errorLogger: errorLogger, context: modelContext)
            analyticsService.track(event: LoadScreenEvent(screenName: String(describing: Self.self)))
        }
        .navigationTitle(Text(with: .cart))
    }
}
