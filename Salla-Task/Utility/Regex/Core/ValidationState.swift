//
//  ValidationState.swift
//  Lemonada
//
//  Created by Amr Elsayed on 04/07/2023.
//

import Foundation

public enum ValidationState: Equatable {
    case none
    case success
    case error(message: String)
}
