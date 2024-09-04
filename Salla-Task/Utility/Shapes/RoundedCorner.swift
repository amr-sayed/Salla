//
//  RoundedCorner.swift
//  Lemonada
//
//  Created by Amr Elsayed on 09/07/2023.
//

import SwiftUI

import SwiftUI

/// This Shape is used to clipShape corner radius to specific corners
/// ```swift
/// RoundedCorner(
///   radius: CGFloat,
///   corners: UIRectCorner
/// )
/// ```
struct RoundedCorner: Shape {
    let radius: CGFloat
    let corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        return Path(
            UIBezierPath(
                roundedRect: rect,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            ).cgPath
        )
    }
}
