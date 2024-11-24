//
//  AnalyticsServiceKey.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 24/11/2024.
//

import SwiftUI

struct AnalyticsServiceKey: EnvironmentKey {
    // you can also set the real user service as the default value
    static let defaultValue: any AnalyticsServiceProtocol = FireBaseAnalyticsService()
}

extension EnvironmentValues {
    var analyticsService: any AnalyticsServiceProtocol {
        get { self[AnalyticsServiceKey.self] }
        set { self[AnalyticsServiceKey.self] = newValue }
    }
}
