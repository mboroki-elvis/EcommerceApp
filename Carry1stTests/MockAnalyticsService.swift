//
//  MockAnalyticsService.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 24/11/2024.
//

@testable import Carry1st

class MockAnalyticsService: AnalyticsServiceProtocol {
    var trackedEvents: [AnalyticsEvent] = []

    func track(event: AnalyticsEvent) {
        trackedEvents.append(event)
    }
}
