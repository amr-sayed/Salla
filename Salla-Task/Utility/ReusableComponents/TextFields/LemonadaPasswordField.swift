//
//  LemonadaPasswordField.swift
//  Lemonada
//
//  Created by Amr Elsayed on 19/06/2023.
//

import SwiftUI

struct LemonadaPasswordField: View {
    var passwordHint: String
    var title: String
    @Binding var textInput: String
    @FocusState var focusSecureField: Bool
    @FocusState var focusPlainField: Bool
    @State var showPassword: Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.Gillsans.Normal.normal_16)
            HStack {
                ZStack {
                    Group {
                        TextField("password", text: $textInput)
                            .focused($focusPlainField)
                            .frame(height: ReusableComponents.LemonadaCustomField.height)
                            .padding()
                            .opacity(showPassword ? 1 : 0)
                        
                        SecureField("password", text: $textInput)
                            .focused($focusSecureField)
                            .frame(height: ReusableComponents.LemonadaCustomField.height)
                            .padding()
                            .opacity(showPassword ? 0 : 1)
                        
                    }
                }
                Image(showPassword ?  "eye": "eye")
                    .padding()
                    .onTapGesture {
                        showPassword.toggle()
                        if showPassword { focusPlainField = true } else { focusSecureField = true }
                    }
            }
            .overlay {
                RoundedRectangle(
                    cornerRadius: ReusableComponents.LemonadaCustomField.cornerRadius)
                .stroke(Color.gray).opacity(ReusableComponents.LemonadaCustomField.opacity
                )
            }
        }
    }
}

struct LemonadaPasswordField_Previews: PreviewProvider {
    static var previews: some View {
        LemonadaPasswordField(passwordHint: "Password", title: "", textInput: .constant(""))
            .padding()
    }
}
