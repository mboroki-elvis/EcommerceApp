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
    @Environment(\.cartDatasource) private var cartDatasource
    @Environment(\.errorLogger)  private var errorLogging
    @Environment(\.modelContext) private var modelContext

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
                    guard router.currentRoute != .cart else { return }
                    router.push(.cart)
                }, label: {
                    BadgeIconView(badgeCount: viewModel.cart.count, systemImageName:  "cart.circle.fill")
                })
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
        .onAppear {
            viewModel.fetchCart(datasource: cartDatasource, errorLogger: errorLogging, context: modelContext)
        }
    }
}
