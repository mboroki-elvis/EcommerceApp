//
//  ContainerView.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import SwiftUI

struct ContainerView<Content: View>: View {
    var error: LocalizedError?
    var onDismissError: () -> Void
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(spacing: .zero) {
            if let error {
                HStack {
                    VStack(alignment: .leading) {
                        Text(with: .error)
                            .lineLimit(2)
                            .font(.title3)
                        if let errorMessage = error.errorDescription {
                            Text(errorMessage)
                                .lineLimit(2)
                                .font(.caption)
                        }
                    }
                    .padding()

                    Spacer()

                    Button {
                        onDismissError()
                    } label: {
                        Image(systemName: "x.circle")
                            .font(.title)
                            .foregroundStyle(Color.onContainer)
                    }
                    .padding(.trailing)
                }
                .background(.accent.opacity(0.7))
                .clipShape(
                    .rect(
                        topLeadingRadius: .small,
                        bottomLeadingRadius: .small,
                        bottomTrailingRadius: .small,
                        topTrailingRadius: .small
                    )
                )
                .padding()
            }
            content()
            Spacer()
        }
        .transition(.slide)
        .animation(.easeInOut, value: error != nil)
    }
}
