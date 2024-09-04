//
//  AlertView.swift
//  Lemonada
//
//  Created by Amr Elsayed on 23/08/2023.
//

import SwiftUI

struct AlertView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var text: String
    var action: (()->())?
    var body: some View {
        VStack {
            VStack {
                Text(text)
                    .font(.Gillsans.medium.medium_18)
                    .padding(.top)
                Button {
                    if let completion = action {
                        completion()
                    }else {
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Text("Okay")
                        .foregroundColor(Color.white)
                        .padding(.vertical)
                        .padding(.horizontal, 70)
                        .background(Color.black)
                    
                }
                .buttonStyle(.borderless)
                .cornerRadius(10)
                .padding(.top, 30)
                
            }
            .frame(width: 350, height: 200)
            .background(Color.white)
            .cornerRadius(15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.2))
    }

}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(text: "This Error")
    }
}
