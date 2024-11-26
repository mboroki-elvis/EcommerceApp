//
//  CacheService.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 26/11/2024.
//

import Foundation

final class CacheService<T: Hashable>: CacheServiceProtocol {
    private let cache = NSCache<NSString, NSArray>()
    private var cacheTimestamps: [String: Date] = [:]
    private var cacheKey: String
    private let cacheValidity: TimeInterval = 60 * 5 // 5 minutes
    
    init(with key: String) {
        self.cacheKey = key
    }

    func getItem(forKey key: String) -> [T]? {
        guard isCacheValid(forKey: key) else {
            clearCache(forKey: key)
            return nil
        }
        
        if let cachedArray = cache.object(forKey: key as NSString) as? [T] {
            return cachedArray
        }
        return nil
    }
    
    func setItem(_ item: [T], forKey key: String) {
        cache.setObject(item as NSArray, forKey: key as NSString)
        cacheTimestamps[key] = Date()
    }
    
    func clearCache() {
        cache.removeAllObjects()
        cacheTimestamps.removeAll()
    }
    
    func isCacheValid(forKey key: String) -> Bool {
        if let timestamp = cacheTimestamps[key] {
            return Date().timeIntervalSince(timestamp) < cacheValidity
        }
        return false
    }
    
    private func clearCache(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
        cacheTimestamps.removeValue(forKey: key)
    }
}
