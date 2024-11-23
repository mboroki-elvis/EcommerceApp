//
//  ProductListView.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import SwiftUI

struct ProductListView: View {
    @State private var viewModel: ProductListViewModel = .init()

    var body: some View {
        List(viewModel.products) { product in
            ProductRow(product: product)
        }
        .onAppear(perform: viewModel.fetchProducts)
    }
}
