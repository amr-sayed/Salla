//
//  LemonadeCustomField.swift
//  Lemonada
//
//  Created by Amr Elsayed on 19/06/2023.
//

import SwiftUI

struct LemonadaCustomField: View {
    var hint: String
    var title: String
    @Binding var textInput: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.space_8) {
            Text(title)
                .font(.Gillsans.Normal.normal_16)
            TextField(hint, text: self.$textInput)
                .frame(height: ReusableComponents.LemonadaCustomField.height)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: ReusableComponents.LemonadaCustomField.cornerRadius)
                        .stroke(Color.gray).opacity(ReusableComponents.LemonadaCustomField.opacity)
                )
        }
    }
}

struct LemonadeCustomField_Previews: PreviewProvider {
    static var previews: some View {
        LemonadaCustomField(hint: "Ex: Name", title: "hellop",textInput: .constant(""))
            .previewLayout(.sizeThatFits)
        
    }
}
