//
//  SizeTokens.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import SwiftUI

enum SizeTokens {
    static let extraSmall: CGFloat = 4
    static let small: CGFloat = 8
    static let regular: CGFloat = 16
    static let large: CGFloat = 32
}

extension CGFloat {
    static let extraSmall = SizeTokens.extraSmall
    static let small = SizeTokens.small
    static let regular = SizeTokens.regular
    static let large = SizeTokens.large
}
