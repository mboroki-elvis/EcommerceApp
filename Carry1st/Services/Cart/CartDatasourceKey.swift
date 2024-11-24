//
//  CartDatasourceKey.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 24/11/2024.
//

import SwiftUI

struct CartDatasourceKey: EnvironmentKey {
    // you can also set the real user service as the default value
    static let defaultValue: any CartDatasourceProtocol = CartDatasource()
}

extension EnvironmentValues {
    var cartDatasource: any CartDatasourceProtocol {
        get { self[CartDatasourceKey.self] }
        set { self[CartDatasourceKey.self] = newValue }
    }
}
