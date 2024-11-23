//
//  SnackBarModifier.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import SwiftUI

struct SnackBarModifier: ViewModifier {
    @Binding var isDisplaying: Bool
    let title: String
    var description: String?
    let position: (Edge.Set, CGFloat)
    let horizontalPadding: CGFloat

    public func body(content: Content) -> some View {
        ZStack {
            content
            snackbar
        }
    }

    private var snackbar: some View {
        VStack {
            if position.0 == .bottom {
                Spacer()
            }

            if isDisplaying {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 16) {
                        Text(title)
                            .foregroundColor(.onContainer)
                            .multilineTextAlignment(.leading)
                            .font(.caption)
                    }
                    if let description {
                        Text(description)
                            .foregroundColor(.onContainer)
                            .font(.caption2)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation {
                            isDisplaying = false
                        }
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.container)
                        .shadow(color: Color.black, radius: 2, x: 0, y: 2)
                )
            }

            if position.0 == .top {
                Spacer()
            }
        }
        .compositingGroup()
        .padding(position.0, position.1)
        .padding(.horizontal, horizontalPadding)
    }
}

extension View {
    func snackBar(
        isDisplaying: Binding<Bool>,
        title: String,
        description: String,
        position: (Edge.Set, CGFloat) = (.bottom, 60),
        horizontalPadding: CGFloat = 24
    ) -> some View {
        modifier(
            SnackBarModifier(
                isDisplaying: isDisplaying,
                title: title,
                description: description,
                position: position,
                horizontalPadding: horizontalPadding
            )
        )
    }
}
