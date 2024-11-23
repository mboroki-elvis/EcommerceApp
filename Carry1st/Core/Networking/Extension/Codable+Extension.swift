//
//  Codable+Extension.swift
//  Carry1st
//
//  Created by Elvis Mwenda on 23/11/2024.
//

import Foundation

extension Encodable {
    func convertToQueryParameters() -> [String: Any]? {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(self)
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
            guard let dictionary = jsonObject as? [String: Any] else {
                return nil
            }
            return dictionary
        } catch {
            print("Error encoding model to JSON: \(error)")
            return nil
        }
    }
}
