//
//  Validator.swift
//  Lemonada
//
//  Created by Amr Elsayed on 04/07/2023.
//

import Foundation

public class Validator {
    private(set) var rules: [RegexRule]
    
    init(rules: [RegexRule] = []) {
        self.rules = rules
    }
    
    convenience init?(rules: [RegexRule]? = []) {
        guard let rules = rules else {
            return nil
        }
        self.init(rules: rules)
    }
    
    @discardableResult
    public func clearAll() -> Validator {
        rules.removeAll()
        return self
    }
    
    @discardableResult
    public func addRule(_ rule: RegexRule) -> Validator {
        rules.append(rule)
        return self
    }
    
    @discardableResult
    public func addRules(_ rules: [RegexRule]) -> Validator {
        self.rules.append(contentsOf: rules)
        return self
    }
    
    public func validate(_ value: String) -> [ValidationState] {
        return rules.compactMap({ $0.validate(value) })
    }
    
    public func validate(_ value: String) -> [Validation] {
        rules.compactMap { rule in
            let validation: Bool = rule.validate(value)
            return Validation(validation: validation, message: rule.message)
        }
    }
    
    /// none passed validations
    /// - Parameter value: value to run validations on it
    /// - Returns: filter validations upon its status must != .success return as [ValidationState]
    public func getFailureValidations(_ value: String) -> [ValidationState] {
        var inputStates: [ValidationState] = validate(value)
        inputStates = inputStates.filter { $0 != .success }
        return inputStates
    }
}
