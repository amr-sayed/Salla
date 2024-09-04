//
//  BaseError.swift
//  OneBank
//
//  Created by Karim Azmi on 08/08/2021.
//  Copyright © 2021 Atos. All rights reserved.
//

import Foundation

struct BaseError: Error {
    let code: Int
    let title: String
    let message: String
    let icon: String?
    let type: ErrorType
    let style: ErrorStyle
    let priority: ErrorPriority
    
    init(
        code: Int,
        statusCode: Int? = nil,
        type: ErrorType,
        message: String,
        icon: String? = nil,
        style: ErrorStyle? = nil,
        priority: ErrorPriority? = nil
    ) {
        self.code = code
        self.message = message
        self.type = type
        
        self.title = type.title
        self.icon = icon ?? type.icon
        self.style = style ?? type.style
        self.priority = priority ?? type.priority
    }
}

extension BaseError: Equatable {}

extension BaseError {
    // Variable to cast BaseError to AlertItem
//    var alertItem: AlertItem {
//        let alertActions: [AlertAction] = [.init(title: Localizable.General.okay.localized, action: {})]
//        return AlertItem(title: title, message: message, actions: alertActions)
//    }
}
