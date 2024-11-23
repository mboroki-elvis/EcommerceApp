//
//  Inject.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import Swinject

@propertyWrapper
struct Inject<T> {
    public lazy var wrappedValue = SwinjectContainer.shared.resolve(T.self)

    public init() {}
}

class SwinjectContainer {
    static let shared = SwinjectContainer()
    fileprivate let container = Container()

    private init() {}
    
    public func register<T>(_ serviceType: T.Type, _ implementation: @escaping () -> T) {
        register(serviceType, implementationMethod: implementation, objectScope: .graph)
    }

    public func registerSingleton<T>(_ serviceType: T.Type, _ implementation: @escaping () -> T) {
        register(serviceType, implementationMethod: implementation, objectScope: .container)
    }
    
    private func register<T>(_ serviceType: T.Type, implementationMethod: @escaping () -> T, objectScope: ObjectScope) {
        container.register(serviceType, factory: { _ in implementationMethod() }).inObjectScope(objectScope)
    }
    
    public func resolve<T>(_ dependency: T.Type = T.self) -> T {
        guard let implementation = container.synchronize().resolve(dependency) else {
            fatalError("No implementation was registered for \(dependency). Make sure that \(dependency) was registered.")
        }
        return implementation
    }
}
