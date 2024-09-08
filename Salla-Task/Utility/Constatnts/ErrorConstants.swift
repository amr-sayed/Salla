//
//  BusinessCodeConstants.swift
//  OneBank
//
//  Created by Karim Azmi on 08/09/2021.
//  Copyright © 2021 Atos. All rights reserved.
//

import Foundation

enum ErrorConstants {
    enum Range {
        static let unwrappedHttpClientRange = 1400...1499
        static let unwrappedHttpServerRange = 1500...1599
        static let wrappedHttpClientRange = 4000...4999
        static let wrappedHttpServerRange = 5000...5999
        static let businessRange = 6000...7999
    }
    
    enum Code {
        static let connectionCode = -1
        static let unwrappedHttpClientCode = 1400
        static let unwrappedHttpServerCode = 1500
        static let wrappedHttpClientCode = 4000
        static let wrappedHttpServerCode = 5000
        static let businessCode = 6000
        static let mappingCode = -1
        static let logicalCode = -1
        static let hardwareCode = -1
        static let exceptionCode = -1
        static let permissionCode = -1
        static let validationCode = -1
        static let unexpectedCode = -1
    }
}
