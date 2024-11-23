//
//  NumberFormatterUtility.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import Foundation

protocol NumberFormatterUtilityProtocol {
    var currencyFormatter: NumberFormatter { get }
    func string(from: NSNumber, currency: String) -> String?
}

class NumberFormatterUtility: NumberFormatterUtilityProtocol {
    static let shared = NumberFormatterUtility()

    private init() {} // Prevent instantiation

    var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current // Automatically adapts to the user's region
        formatter.currencySymbol = "$"
        return formatter
    }
    
    func string(from: NSNumber, currency symbol: String) -> String? {
        currencyFormatter.currencySymbol = symbol
        return currencyFormatter.string(from: from)
    }
}
