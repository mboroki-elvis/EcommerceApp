//
//  Carry1stApp.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import SwiftData
import SwiftUI

@main
struct Carry1stApp: App {
    @State private var router = AppRouter(.landing)
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
        let container = SwinjectContainer.shared
        container.register(ProductServiceProtocol.self) {
            ProductService()
        }
        container.register(AppEnvironment.self) {
            EnvironmentLive()
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
    }

    var body: some Scene {
        WindowGroup {
            AppCoordinator()
        }
        .modelContainer(Self.sharedModelContainer)
        .environment(router)
        .environment(CartViewModel())
    }
}
