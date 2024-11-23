//
//  LocalizableKeys.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import Foundation
import SwiftUI

enum LocalizableKeys: String {
    case addToCart = "add_to_cart"
    case buyNow = "buy_now"
    case error = "Something went wrong!"

    func toLocalizableKey() -> LocalizedStringKey {
        LocalizedStringKey(self.rawValue)
    }

    func localized(args: CVarArg...) -> String {
        let localized = NSLocalizedString(self.rawValue, comment: self.rawValue)
        return String(format: localized, args)
    }
}