//
//  ProductRow.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import SwiftUI

struct ProductRow: View {
    let product: Product

    var body: some View {
        HStack {
            CachedAsyncImage(url: URL(string: product.imageLocation)) { image in
                image.resizable()
            } placeholder: {
                ProgressView().tint(.accent)
            }
            .frame(width: 50, height: 50)
            .cornerRadius(.small)

            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.headline)
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}
