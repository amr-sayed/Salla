//
//  HeaderView.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 06/09/2024.
//

import SwiftUI

struct HeaderView: View {
    let name: String
    let action: (()->())?
    
    var body: some View {
        HStack {
            Button(action: {
                guard let btnAction = action else {
                    return
                }
                btnAction()
            }, label: {
                Image(systemName: "arrow.left")
                    .tint(Color.black)
            })
            Spacer()
            Text(name)
                .font(.Regular.regular_16)
                .padding(10)
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    HeaderView(name: "sdsds") {
        
    }
}
