//
//  FireBaseAnalyticsService.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import FirebaseAnalytics

class FireBaseAnalyticsService: AnalyticsServiceProtocol {
    func track(event: any AnalyticsEvent) {
        Analytics.logEvent(event.name, parameters: event.parameters)
    }
}
