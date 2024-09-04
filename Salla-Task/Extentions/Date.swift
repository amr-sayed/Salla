//
//  Date.swift
//  Lemonada
//
//  Created by Amr Elsayed on 16/01/2024.
//

import Foundation

extension Date {
    func formateDateToString() -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "MM/dd/yyyy"
        inputFormatter.dateFormat = "yyyy-MM-dd"
        let resultString = inputFormatter.string(from: self)
        print(resultString)
        return resultString
    }
    
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}
