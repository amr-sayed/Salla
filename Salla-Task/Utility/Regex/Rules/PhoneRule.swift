//
//  PhoneRule.swift
//  OneBank
//
//  Created by Karim Azmi on 03/08/2021.
//  Copyright © 2021 Atos. All rights reserved.
//

import Foundation

class PhoneRule: Regex {
    convenience init(message: String = "phone_number_validation_message") {
        self.init(
            regex: "(1)[0-9]{9}|(01)[0-9]{9}",
            message: message
        )
    }
}
