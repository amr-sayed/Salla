//
//  ErrorType.swift
//  OneBank
//
//  Created by Karim Azmi on 08/08/2021.
//  Copyright © 2021 Atos. All rights reserved.
//

import Foundation

enum ErrorType {
    // MARK: - Network
    case connection
    case unwrappedHttpClient
    case unwrappedHttpServer
    
    // MARK: - Backend
    case wrappedHttpClient
    case wrappedHttpServer
    case business
    
    // MARK: - Decoder
    case mapping
    
    // MARK: - Local
    case logical
    case hardware
    case exception
    case permission
    case validation
    
    // MARK: - OTHER
    case unexpected
}
