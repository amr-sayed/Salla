//
//  UIFont.swift
//  Lemonada
//
//  Created by Amr Elsayed on 20/06/2023.
//

import SwiftUI

extension Font {
    private static let regular = "DINNextLTArabic-Regular"
    private static let medium = "Gillsans-medium"
    
    
    
    enum Regular {
        static let regular_12 = Font.custom(regular, size: 12.0)
        static let regular_14 = Font.custom(regular, size: 14.0)
        static let regular_16 = Font.custom(regular, size: 16.0)
    }
    
    enum Medium {
        static let medium_12 = Font.custom(medium, size: 12.0)
        static let medium_14 = Font.custom(medium, size: 14.0)
        static let medium_16 = Font.custom(medium, size: 16.0)
        static let medium_18 = Font.custom(medium, size: 18.0)
    }
    
}
