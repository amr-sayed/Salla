//
//  ProductView.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 05/09/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductView: View {
    let product: Product
    var body: some View {
        VStack(spacing: .zero) {
            WebImage(url: URL(string: product.image?.url ?? .empty))
                .resizable()
                .frame(height: Spacing.spacing_150)
            
            VStack(spacing: .zero) {
                Text(product.name ?? .empty)
                    .lineLimit(1)
                    .font(.Regular.regular_16)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
               
                Text("Special Offer")
                    .font(.Regular.regular_12)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("\(String(format: "%.2f", product.price ?? 0.0)) \(product.currency ?? .empty)")
                    .font(.Regular.regular_14)
                    .foregroundColor(.black)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.horizontal, Spacing.spacing_8)
            
            Button {
                
            } label: {
                Text("Add to cart")
                    .padding(.vertical, Spacing.spacing_6)
                    .font(.Regular.regular_14)
            }
            .frame(maxWidth: .infinity)
            .background(ConfigurationManager.shared.loadAppColor())
            .cornerRadius(Spacing.spacing_10)
            .foregroundColor(.white)
            .padding(.horizontal,Spacing.spacing_6)
            .padding(.bottom,Spacing.spacing_6)
            
        }
        .background(Color.white)
        .cornerRadius(Spacing.spacing_10)
        .shadow(radius: Spacing.spacing_2)
    }
}
