//
//  EmailRule.swift
//  OneBank
//
//  Created by Amr Hesham on 22/11/2021.
//  Copyright © 2021 Atos. All rights reserved.
//

import Foundation

struct EmailRule: RegexRule {    
    var regex: String
    var message: String
    
    init() {
        self.regex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
        self.message = "Invalid e-mail Address"
    }
}
