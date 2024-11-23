//
//  AnalyticsServiceProtocol.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

/// A protocol that defines the requirements for an analytics service.
protocol AnalyticsServiceProtocol {
    /// Tracks the given analytics event.
    /// 
    /// - Parameter event: The event to track.
    func track(event: AnalyticsEvent)
}
