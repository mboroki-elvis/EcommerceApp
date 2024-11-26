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
    @Environment(\.errorLogger) private var errorLogger
    @Environment(\.cartDatasource) private var cartDatasource
    @Environment(\.modelContext) private var modelContext

    let product: Product

    var body: some View {
        ContainerView(error: viewModel.apiError, onDismissError: {
            viewModel.resetError()
        }, content: {
            List {
                ProductRow(product: product)
                    .accessibilityIdentifier(AccessbilityIdentifier.productDetailRow.rawValue)
                Text(product.description)
                    .font(.body)
                    .accessibilityIdentifier(AccessbilityIdentifier.productDescription.rawValue)
            }
            .accessibilityIdentifier(AccessbilityIdentifier.productDetailList.rawValue)
            .listSectionSpacing(0)
            .safeAreaInset(edge: .bottom) {
                anchoredActionBar
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

    private var anchoredActionBar: some View {
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
            .accessibilityIdentifier(AccessbilityIdentifier.addToCartButton.rawValue)

            Button(action: {
                analyticsService.track(event: PurchaseEvent(product: product))
            }) {
                Text(with: .buyNow)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .accessibilityIdentifier(AccessbilityIdentifier.buyNowButton.rawValue)
        }
    }
}

extension ProductDetailView {
    enum AccessbilityIdentifier: String {
        case addToCartButton
        case buyNowButton
        case productDetailList
        case productDescription
        case productDetailRow
    }
}
