//
//  ErrorLoggingServiceKey.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 24/11/2024.
//

import SwiftUI

struct ErrorLoggingServiceKey: EnvironmentKey {
    // you can also set the real user service as the default value
    static let defaultValue: any ErrorLoggingServiceProtocol = CrashlyticsErrorLoggingService()
}

extension EnvironmentValues {
    var errorLogger: any ErrorLoggingServiceProtocol {
        get { self[ErrorLoggingServiceKey.self] }
        set { self[ErrorLoggingServiceKey.self] = newValue }
    }
}
