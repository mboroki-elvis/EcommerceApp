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
    @Bindable private var snackBarState: SnackbarState
    static var sharedModelContainer: ModelContainer = {
        let schema = Schema([CartItem.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    init() {
        let snackBarState = SnackbarState()
        self.snackBarState = snackBarState
        let container = SwinjectContainer.shared
        container.register(ProductServiceProtocol.self) {
            ProductService()
        }
        container.register(AppEnvironment.self) {
            EnvironmentLive()
        }
        container.register(ErrorLoggingServiceProtocol.self) {
            CrashlyticsErrorLoggingService()
        }
        container.register(AnalyticsServiceProtocol.self) {
            FireBaseAnalyticsService()
        }
        container.registerSingleton(ImageCache.self) {
            ImageCache.shared
        }
        container.registerSingleton(NumberFormatterUtilityProtocol.self) {
            NumberFormatterUtility.shared
        }
        container.register(CartDatasourceProtocol.self) {
            CartDatasource()
        }
        container.register(ModelContext.self) {
            Self.sharedModelContainer.mainContext
        }
        container.register(SnackbarState.self) {
            snackBarState
        }
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            AppCoordinator()
        }
        .modelContainer(Self.sharedModelContainer)
        .environment(router)
        .environment(CartViewModel())
        .environment(snackBarState)
    }
}
