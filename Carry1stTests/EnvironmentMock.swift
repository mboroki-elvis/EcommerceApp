//
//  EnvironmentMock.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 24/11/2024.
//

@testable import Carry1st

struct EnvironmentMock: AppEnvironment {
    var apiKey: String { "" }
    var imageURL: String { "" }
    var baseURL: String { "" }
}
