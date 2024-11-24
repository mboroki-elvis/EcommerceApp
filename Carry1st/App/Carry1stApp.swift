//
//  Carry1stApp.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import SwiftData
import SwiftUI
import Firebase

@main
struct Carry1stApp: App {
    @State private var router = AppRouter(.landing)
    @Bindable var snackBarState = SnackbarState()
    @Bindable var imageCache = ImageCache()
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([CartItem.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            AppCoordinator()
        }
        .environment(router)
        .environment(CartViewModel())
        .environment(snackBarState)
        .environment(imageCache)
        .modelContainer(sharedModelContainer)
    }
}
