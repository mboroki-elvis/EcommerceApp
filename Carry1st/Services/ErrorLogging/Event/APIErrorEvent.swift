//
//  APIErrorEvent.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

struct APIErrorEvent: ErrorEvent {
    let message: String = "API Error"
    
    let level: ErrorLevel = .error
    
    let error: Error
    
    var userInfo: [String : Any]? {
        ["error": error]
    }
}
