//
//  Validator+Strings.swift
//  Lemonada
//
//  Created by Amr Elsayed on 04/07/2023.
//

import Foundation

extension String {
    func validate(using validator: Validator) -> [ValidationState] {
        return validator.validate(self)
    }
    
    func validate(using validator: Validator) -> [Validation] {
        return validator.validate(self)
    }
    
    /// none passed validations
    /// - Parameter value: value to run validations on it
    /// - Returns: filter validations upon its status must != .success return as [ValidationState]
    public func getFailureValidations(using validator: Validator) -> [ValidationState] {
        return validator.getFailureValidations(self)
    }
}
