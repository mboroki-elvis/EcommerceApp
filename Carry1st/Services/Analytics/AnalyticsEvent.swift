//
//  AnalyticsEvent.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import Foundation

/// A protocol that defines the requirements for an analytics event.
protocol AnalyticsEvent {
    /// The name of the event.
    var name: String { get }
    /// The parameters associated with the event.
    var parameters: [String: Any]? { get }
}
