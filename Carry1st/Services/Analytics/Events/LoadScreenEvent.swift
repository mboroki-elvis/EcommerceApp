//
//  LoadScreenEvent.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

struct LoadScreenEvent: AnalyticsEvent {
    let name: String = "screen_load"

    let screenName: String
    
    var parameters: [String: Any]? {
        ["screen_name": screenName]
    }
}
