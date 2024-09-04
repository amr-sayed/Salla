//
//  ErrorView.swift
//  Lemonada
//
//  Created by Amr Elsayed on 04/07/2023.
//

import SwiftUI

struct ErrorView: View {
    var errorMessage : String
    var body: some View {
        Text(errorMessage)
            .font(.Gillsans.Normal.normal_12)
            .foregroundColor(.red)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorMessage: "enter valid password")
    }
}
