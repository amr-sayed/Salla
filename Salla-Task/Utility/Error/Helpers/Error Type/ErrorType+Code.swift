//
//  ErrorType+Code.swift
//  OneBank
//
//  Created by Karim Azmi on 08/08/2021.
//  Copyright © 2021 Atos. All rights reserved.
//

import Foundation

extension ErrorType {
    var code: Int {
        switch self {
        case .connection: return ErrorConstants.Code.connectionCode
        case .unwrappedHttpClient: return ErrorConstants.Code.unwrappedHttpClientCode
        case .unwrappedHttpServer: return ErrorConstants.Code.unwrappedHttpServerCode
        case .wrappedHttpClient: return ErrorConstants.Code.wrappedHttpClientCode
        case .wrappedHttpServer: return ErrorConstants.Code.wrappedHttpServerCode
        case .business: return ErrorConstants.Code.businessCode
        case .mapping: return ErrorConstants.Code.mappingCode
        case .logical: return ErrorConstants.Code.logicalCode
        case .hardware: return ErrorConstants.Code.hardwareCode
        case .exception: return ErrorConstants.Code.exceptionCode
        case .permission: return ErrorConstants.Code.permissionCode
        case .validation: return ErrorConstants.Code.validationCode
        case .unexpected: return ErrorConstants.Code.unexpectedCode
        }
    }
}
