//
//  ErrorType+Title.swift
//  OneBank
//
//  Created by Karim Azmi on 08/08/2021.
//  Copyright © 2021 Atos. All rights reserved.
//

import Foundation

extension ErrorType {
    // TODO: Add all localized keys for titles for each type [Karim Azmi]
    var title: String {
        switch self {
        case .connection: return "Connection Title"
        case .unwrappedHttpClient: return "Unwrapped HTTP Client Title"
        case .unwrappedHttpServer: return "Unwrapped HTTP Server Title"
        case .wrappedHttpClient: return "Wrapped HTTP Client Title"
        case .wrappedHttpServer: return "Wrapped HTTP Server Title"
        case .business: return "Business Title"
        case .mapping: return "Mapping Title"
        case .logical: return "Logical Title"
        case .hardware: return "Hardware Title"
        case .exception: return "Exception Title"
        case .permission: return "Permission Title"
        case .validation: return "Validation Title"
        case .unexpected: return "Unexpected Title"
        }
    }
}
