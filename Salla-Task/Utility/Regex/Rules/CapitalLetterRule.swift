//
//  CapitalLetterRule.swift
//  OneBank
//
//  Created by Karim Azmi on 03/08/2021.
//  Copyright © 2021 Atos. All rights reserved.
//

import Foundation

class CapitalLetterRule: Regex {
    convenience init(message: String = "signup_password_use_capital_letter") {
        self.init(
            regex: ".*[A-Z]+.*",
            message: message
        )
    }
}
