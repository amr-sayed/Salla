//
//  Regex.swift
//  Lemonada
//
//  Created by Amr Elsayed on 04/07/2023.
//

import Foundation

public class Regex: RegexRule {
    public let regex: String
    public let message: String
    
    init(regex: String, message: String = "Invalid Regular Expression") {
        self.regex = regex
        self.message = message.localized
    }
}
