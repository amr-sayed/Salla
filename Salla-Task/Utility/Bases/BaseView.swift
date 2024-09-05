//
//  BaseView.swift
//  Lemonada
//
//  Created by Amr Elsayed on 31/07/2023.
//

import SwiftUI

struct BaseView<Content>: View where Content: View {
    private let content: Content
    @Binding var isLoading: Bool
    public init(isLoading : Binding<Bool>,@ViewBuilder content: () -> Content) {
        self.content = content()
        self._isLoading = isLoading
    }
    
    var body : some View {
        ZStack {
            content
            if isLoading {
//                LoadingView()
            }
            
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView(isLoading: .constant(true)) {
            Text("Heloo")
        }
    }
}
