//
//  ErrorLoggingServiceProtocol.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

/// A protocol that defines the requirements for an error logging service.
protocol ErrorLoggingServiceProtocol {
    /// Logs the given error event.
    ///
    /// - Parameter event: The error event to log.
    func log(event: ErrorEvent)
}
