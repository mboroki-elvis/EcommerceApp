//
//  AppEnvironment.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import Foundation

protocol AppEnvironment {
    var baseURL: String { get }
    func string(for key: EnvironmentKeys) -> String
}

extension AppEnvironment {
    func string(for key: EnvironmentKeys) -> String {
        Bundle.main.infoDictionary?[key.rawValue] as! String
    }
}

struct EnvironmentLive: AppEnvironment {
    var baseURL: String { string(for: .apiURL) }
}

enum EnvironmentKeys: String {
    case apiURL = "APP_BASE_URL"
}
