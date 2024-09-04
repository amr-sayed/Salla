//
//  LemonadaPickerView.swift
//  Lemonada
//
//  Created by Amr Elsayed on 19/06/2023.
//

import SwiftUI
import SDWebImageSwiftUI


struct LemonadaPickerView: View {
    var title: String
    var hint: String
    var text: String
    var imageUrl: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.space_8) {
            Text(title)
            HStack {
                image
                Text(text.isNotEmpty ? text : hint)
                    .foregroundColor(text.isNotEmpty ? Color.black : Color("darkGrey"))
                    .frame(height: ReusableComponents.LemonadaCustomField.height)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()

                Image("arrowDown")
                    .padding()
            }
            .background(Color("lightGrey"))
            .cornerRadius(ReusableComponents.LemonadaCustomField.cornerRadius)
        }
    }
    
    
    var image:  AnyView? {
        guard imageUrl != "" else {
            return nil
        }
        return WebImage(url: URL(string: imageUrl))
            .resizable()
            .frame(width: 25, height: 25)
            .padding(.leading)
            .eraseToAnyView()
        
    }
}

struct LemonadaPickerView_Previews: PreviewProvider {
    static var previews: some View {
        LemonadaPickerView(title: "sdssd", hint: "jjjjj", text: "", imageUrl: "")
        
            .previewLayout(.sizeThatFits)
    }
}
