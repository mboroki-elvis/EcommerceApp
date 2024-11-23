//
//  AppCoordinator.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import SwiftUI
import SwiftData

enum Routes: Hashable {
    case landing
    case details(Product)
    case cart
}

typealias AppRouter = Router<Routes>

struct AppCoordinator: View {
    @Environment(CartViewModel.self) private var viewModel
    @Environment(AppRouter.self) private var router: AppRouter

    // MARK: - UI

    var body: some View {
        RouterStackView(router: router, viewForRoute: viewForRoute)
    }

    @ViewBuilder private func viewForRoute(_ route: Routes) -> some View {
        Group {
            switch route {
            case .landing:
                ProductListView()
            case .details(let product):
                ProductDetailView(product: product)
            case .cart:
                CartView()
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    router.push(.cart)
                }, label: {
                    Image(systemName: "cart.circle.fill")
                        .foregroundColor(.blue).padding(4)
                })
                .buttonStyle(PlainButtonStyle()) // turn off design, only behavior
                .badge(viewModel.itemCount)
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
    }
}
