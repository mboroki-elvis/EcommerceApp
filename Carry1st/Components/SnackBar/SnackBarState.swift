//
//  SnackBarState.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import Observation
import SwiftUI

@Observable
class SnackbarState {
    var title: String = ""
    var isDisplaying = false
    var description: String = ""

    func show(title: String, description: String? = nil) {
        self.title = title
        self.description = description ?? ""
        self.isDisplaying = true
    }
}
