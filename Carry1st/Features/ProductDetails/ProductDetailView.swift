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
    @Environment(\.analyticsService) private var analyticsService
    @Environment(\.errorLogger)  private var errorLogger
    @Environment(\.cartDatasource)  private var cartDatasource
    @Environment(\.modelContext) private var modelContext
    
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
                        viewModel.addToCart(
                            item: product,
                            datasource: cartDatasource,
                            eventLogger: analyticsService,
                            errorLogger: errorLogger,
                            context: modelContext,
                            snackBarState: snackBarState
                        )
                    }) {
                        Text(with: .addToCart)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    Button(action: {
                        analyticsService.track(event: PurchaseEvent(product: product))
                    }) {
                        Text(with: .buyNow)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                }
            }
            .padding(.horizontal)
        })
        .snackBar(
            isDisplaying: .init(get: { snackBarState.isDisplaying }, set: { snackBarState.isDisplaying = $0 }),
            title: LocalizableKeys.addToCart.localized(),
            description: product.name
        ).onAppear {
            analyticsService.track(event: LoadScreenEvent(screenName: String(describing: Self.self)))
        }
    }
}
