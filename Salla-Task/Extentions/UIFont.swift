//
//  UIFont.swift
//  Lemonada
//
//  Created by Amr Elsayed on 20/06/2023.
//

import SwiftUI

extension Font {
    private static let normalName = "Gillsans-normal"
    private static let mediumName = "Gillsans-medium"
    private static let boldName = "Gillsans-bold"
    
    
    
    enum Gillsans {
        enum Bold {
            static let bold_24 = Font.custom(boldName, size: 24.0)
            static let bold_21 = Font.custom(boldName, size: 21.0)
            static let bold_18 = Font.custom(boldName, size: 18.0)
            static let bold_16 = Font.custom(boldName, size: 16.0)
            static let bold_14 = Font.custom(boldName, size: 14.0)
            static let bold_13 = Font.custom(boldName, size: 13.0)
            static let bold_12 = Font.custom(boldName, size: 12.0)
        }
        
        enum Normal {
            static let normal_12 = Font.custom(normalName, size: 12.0)
            static let normal_14 = Font.custom(normalName, size: 14.0)
            static let normal_16 = Font.custom(normalName, size: 16.0)
        }
        
        enum medium {
            static let medium_12 = Font.custom(mediumName, size: 12.0)
            static let medium_14 = Font.custom(mediumName, size: 14.0)
            static let medium_16 = Font.custom(mediumName, size: 16.0)
            static let medium_18 = Font.custom(mediumName, size: 18.0)
        }
    }
    
}
