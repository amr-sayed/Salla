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
        VStack(spacing: 0) {
            WebImage(url: URL(string: product.image?.url ?? .empty))
                .resizable()
                .frame(height: 150)
            
            VStack(spacing: 0) {
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
            .padding(.horizontal, 8)
            
            Button {
                
            } label: {
                Text("Add to cart")
                    .padding(.vertical, 6)
                    .font(.Regular.regular_14)
            }
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .cornerRadius(10)
            .foregroundColor(.white)
            .padding(.horizontal,6)
            .padding(.bottom,6)
            
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}
