//
//  BadgeIconView.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import SwiftUI

struct BadgeIconView: View {
    var badgeCount: Int
    var systemImageName: String

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: systemImageName)
                .font(.title)
                .foregroundColor(.containerAlternate)

            if badgeCount > 0 {
                Text("\(badgeCount > 100 ? "99+" : "\(badgeCount)")")
                    .font(.caption2).bold()
                    .foregroundColor(.onContainerAlternate)
                    .frame(width: 18, height: 18)
                    .background(Color.accentColor)
                    .clipShape(Circle())
                    .offset(x: 4, y: 0)
            }
        }
    }
}
