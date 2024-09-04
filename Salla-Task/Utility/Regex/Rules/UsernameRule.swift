//
//  UsernameRule.swift
//  OneBank
//
//  Created by Karim Azmi on 03/08/2021.
//  Copyright © 2021 Atos. All rights reserved.
//

import Foundation

class UsernameRule: Regex {
    convenience init(message: String) {
        self.init(
            regex: "^[a-zA-Z]([._-](?![._-])|[a-zA-Z0-9]){5,55}[a-zA-Z0-9]$",
            message: message
        )
    }
}
