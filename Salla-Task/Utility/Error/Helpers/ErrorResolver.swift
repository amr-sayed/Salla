//
//  ErrorResolver.swift
//  OneBank
//
//  Created by Karim Azmi on 08/08/2021.
//  Copyright © 2021 Atos. All rights reserved.
//

import Foundation

final class ErrorResolver {
    static let shared = ErrorResolver()
    
    private init() {}
    
    func getError(code: Int, reason: String? = nil) -> BaseError {
        var type: ErrorType = .unexpected
        
        switch code {
        case ErrorConstants.Range.unwrappedHttpClientRange: type = .unwrappedHttpClient
        case ErrorConstants.Range.unwrappedHttpServerRange: type = .unwrappedHttpServer
        case ErrorConstants.Range.wrappedHttpClientRange: type = .wrappedHttpClient
        case ErrorConstants.Range.wrappedHttpServerRange: type = .wrappedHttpServer
        case ErrorConstants.Range.businessRange: type = .business
        default: type = .unexpected
        }
        
        return .init(
            code: code,
            type: type,
            message: reason ?? type.message
        )
    }
    
    func getError(for type: ErrorType, message: String? = nil) -> BaseError {
        return .init(
            code: type.code,
            type: type,
            message: message ?? type.message
        )
    }
}
