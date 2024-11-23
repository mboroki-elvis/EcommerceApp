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
                .foregroundColor(.primary)

            if badgeCount > 0 {
                Text("\(badgeCount)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 18, height: 18)
                    .background(Color.red)
                    .clipShape(Circle())
                    .offset(x: 4, y: 0)
            }
        }
    }
}
