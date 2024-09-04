//
//  MinimumNumberRule.swift
//  OneBank
//
//  Created by Amr Ahmed on 12/10/2021.
//  Copyright © 2021 Atos. All rights reserved.
//

import Foundation

class MinimumDigitsRule: Regex {
    convenience init(minimum: Int, message: String? = nil) {
        self.init(
            regex: ".{\(minimum),}",
            message: message ?? "signup_password_minimum_characters".localizedFormat(using: minimum)
        )
    }
}
