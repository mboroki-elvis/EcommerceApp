//
//  MockErrorLoggingService.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 24/11/2024.
//

@testable import Carry1st

class MockErrorLoggingService: ErrorLoggingServiceProtocol {
    var loggedEvents: [ErrorEvent] = []

    func log(event: ErrorEvent) {
        loggedEvents.append(event)
    }
}
