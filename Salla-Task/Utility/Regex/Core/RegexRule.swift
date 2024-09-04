//
//  RegexRule.swift
//  Lemonada
//
//  Created by Amr Elsayed on 04/07/2023.
//

import Foundation

public protocol RegexRule {
    var regex: String { get }
    var message: String { get }
    
    func validate(_ value: String) -> ValidationState
    func validate(_ value: String) -> Bool
}

public extension RegexRule {
    func validate(_ value: String) -> ValidationState {
        validate(value) ? .success : .error(message: message)
    }
    
    func validate(_ value: String) -> Bool {
        NSPredicate(
            format: "SELF MATCHES %@", self.regex
        ).evaluate(
            with: value
        )
    }
}
