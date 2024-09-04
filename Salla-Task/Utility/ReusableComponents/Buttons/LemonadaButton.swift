//
//  LemonadaButton.swift
//  Lemonada
//
//  Created by Amr Elsayed on 19/06/2023.
//

import SwiftUI

struct LemonadaButton: View {
    
    var buttonTitle: String
    var action: (() -> Void)
    
    var body: some View {
        Button(buttonTitle, action: action)
            .foregroundColor(.white)
            .padding()
            .frame(
                width: ReusableComponents.LemonadaButton.width,
                height: ReusableComponents.LemonadaButton.height
            )
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct LemonadaButton_Previews: PreviewProvider {
    static var previews: some View {
        LemonadaButton(buttonTitle: "Login", action: {
            print("Something")
        })
        .previewLayout(.sizeThatFits)
    }
}
