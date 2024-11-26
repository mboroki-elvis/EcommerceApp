//
//  CacheServiceProtocol.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 26/11/2024.
//

import Foundation

protocol CacheServiceProtocol<CachedItem> {
    associatedtype CachedItem: Hashable
    func getItem(forKey key: String) -> [CachedItem]?
    func setItem(_ products: [CachedItem], forKey key: String)
    func clearCache()

    /// Checks if the cache for a given key is still valid.
    ///
    /// - Parameter key: The key associated with the cached data.
    /// - Returns: `true` if the cache is valid, `false` otherwise.
    func isCacheValid(forKey key: String) -> Bool
}
