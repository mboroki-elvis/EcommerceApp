//
//  ProductRow.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import SwiftUI

struct ProductRow: View {
    let product: Product
    private var formatterUtility: NumberFormatterUtilityProtocol = NumberFormatterUtility()
    init(product: Product) {
        self.product = product
    }

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
                Text(formatterUtility.string(from: product.price as NSNumber, currency: product.currencySymbol) ?? "")
                    .font(.subheadline)
            }
            Spacer()
        }
        .contentShape(Rectangle())
    }
}
