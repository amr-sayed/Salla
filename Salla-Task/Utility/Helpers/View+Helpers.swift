//
//  View+Helpers.swift
//  Lemonada
//
//  Created by Amr Elsayed on 05/07/2023.
//

import SwiftUI


extension View {
    
    
    // MARK: - IsHidden
    /// Show and Hide the `View` based on Bool value
    ///
    /// ## Example
    /// Use it to show or hide the view based on bool value instead of write a conditon like below
    /// ```swift
    /// if true {
    ///     Text("Hello")
    /// }
    /// ```
    /// How to use
    /// ```swift
    /// Text("Hello")
    ///     .isHidden(true)
    /// ```
    ///
    /// - Parameter isHidden: A Boolean value that indicates whether to hide the View.
    /// - Returns: A view that is hidden or not.
    func isHidden(_ isHidden: Bool) -> Self? {
        isHidden ? nil : self
    }
    
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
    
    @ViewBuilder
    func overlay<Content: View>(when condition: Bool, _ content: Content) -> some View {
        if condition {
            overlay(content)
        } else {
            self
        }
    }
}
