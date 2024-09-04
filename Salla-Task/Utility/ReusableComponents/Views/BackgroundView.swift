//
//  BackgroundView.swift
//  Lemonada
//
//  Created by Amr Elsayed on 20/06/2023.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Image("background")
            .resizable()
            .opacity(0.1)
            .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
