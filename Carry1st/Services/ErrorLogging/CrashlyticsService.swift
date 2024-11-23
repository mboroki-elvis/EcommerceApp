//
//  CrashLyticsService.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import FirebaseCrashlytics

/// An example error logging service that integrates with Crashlytics.
class CrashlyticsErrorLoggingService: ErrorLoggingServiceProtocol {
    func log(event: ErrorEvent) {
        let error = NSError(
            domain: Bundle.main.bundleIdentifier ?? "",
            code: 0,
            userInfo: event.userInfo
        )
        Crashlytics.crashlytics().record(error: error)
        Crashlytics.crashlytics().log(event.message)
    }
}
