//
//  ErrorEvent.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import Foundation

/// A protocol that defines the requirements for an error event.
protocol ErrorEvent {
    /// A description of the error.
    var message: String { get }
    /// The severity level of the error.
    var level: ErrorLevel { get }
    /// Additional information associated with the error.
    var userInfo: [String: Any]? { get }
}

/// An enumeration representing the severity level of an error.
enum ErrorLevel: String {
    case debug
    case info
    case warning
    case error
    case critical
}
