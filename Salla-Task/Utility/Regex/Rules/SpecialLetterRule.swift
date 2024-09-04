//
//  SpecialLetterRule.swift
//  OneBank
//
//  Created by Karim Azmi on 03/08/2021.
//  Copyright © 2021 Atos. All rights reserved.
//

import Foundation

public class SpecialLetterRule: Regex {
    convenience init(message: String = "signup_password_use_special_letter") {
        self.init(
            regex: ".*[!.&^%$#@()/]+.*",
            message: message
        )
    }
}
