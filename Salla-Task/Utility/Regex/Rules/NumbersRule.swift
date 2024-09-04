//
//  NumbersRule.swift
//  OneBank
//
//  Created by Karim Azmi on 04/08/2021.
//  Copyright © 2021 Atos. All rights reserved.
//

import Foundation

class NumbersRule: Regex {
    convenience init(limit: Int = 100, message: String? = nil) {
        self.init(
            regex: "[0-9]{\(limit)}",
            message: message ?? "general_fill_digits".localizedFormat(using: limit)
        )
    }
}
