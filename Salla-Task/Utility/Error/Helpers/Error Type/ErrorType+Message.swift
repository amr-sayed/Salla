//
//  ErrorType+Message.swift
//  OneBank
//
//  Created by Karim Azmi on 08/08/2021.
//  Copyright © 2021 Atos. All rights reserved.
//

import Foundation

extension ErrorType {
    // TODO: Add all localized keys for messages for each type [Karim Azmi]
    var message: String {
        switch self {
        case .connection: return "Connection Reason"
        case .unwrappedHttpClient: return "Unwrapped HTTP Client Reason"
        case .unwrappedHttpServer: return "Unwrapped HTTP Server Reason"
        case .wrappedHttpClient: return "Wrapped HTTP Client Reason"
        case .wrappedHttpServer: return "Wrapped HTTP Server Reason"
        case .business: return "Business Reason"
        case .mapping: return "Mapping Reason"
        case .logical: return "Logical Reason"
        case .hardware: return "Hardware Reason"
        case .exception: return "Exception Reason"
        case .permission: return "Permission Reason"
        case .validation: return "Validation Reason"
        case .unexpected: return "Unexpected Reason"
        }
    }
}
