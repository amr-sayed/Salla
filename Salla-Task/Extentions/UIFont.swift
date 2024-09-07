//
//  UIFont.swift
//  Lemonada
//
//  Created by Amr Elsayed on 20/06/2023.
//

import SwiftUI

extension Font {
    private static let regular = ConfigurationManager.shared.loadFontFamily()
    
    
    enum Regular {
        static let regular_12 = Font.custom(regular, size: 12.0)
        static let regular_14 = Font.custom(regular, size: 14.0)
        static let regular_16 = Font.custom(regular, size: 16.0)
    }
}
