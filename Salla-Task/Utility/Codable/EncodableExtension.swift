//
//  Encodable.swift
//  Lemonada
//
//  Created by Amr Elsayed on 06/07/2023.
//

import Foundation

extension Encodable {
    var query: String {
        guard let data = try? JSONEncoder().encode(self),
              let json = String(data: data, encoding: .utf8),
              let output = json.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return ""
        }
        
        return output
    }
    
    subscript(key: String) -> Any? {
        return dictionary[key]
    }
    
    var data: Data {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            fatalError("Couldn't encode Data")
        }
    }
    
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] ?? [:]
    }
}
