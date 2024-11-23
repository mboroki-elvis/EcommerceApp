//
//  Text+Extension.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import SwiftUI

extension Text {
    init(with key: LocalizableKeys) {
        self.init(key.toLocalizableKey())
    }

    init(with key: LocalizableKeys, args: CVarArg...) {
        self.init(key.localized(args: args))
    }
}
