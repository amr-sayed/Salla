//
//  ProductDetailsView.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 06/09/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel: ProductDetailsViewModel
    var body: some View {
        VStack{
            
            HeaderView(
                name: viewModel.product.name ?? .empty) {
                    presentationMode.wrappedValue.dismiss()
                }
            
            WebImage(url: URL(string: viewModel.product.image?.url ?? .empty))
                .resizable()
                .frame(height: Spacing.spacing_300)
                .padding()
            
            VStack(alignment: .leading, spacing: Spacing.spacing_16) {
                Text(viewModel.product.name ?? .empty)
                    .font(.Regular.regular_16)
                
                Text("Buy now and pay now")
                    .font(.Regular.regular_16)
                    .foregroundColor(.gray)
                
                Text("\(String(format: "%.2f", viewModel.product.price ?? 0.0)) \(viewModel.product.currency ?? .empty)")
                    .font(.Regular.regular_16)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationBarHidden(true)
    }
}

#Preview {
    ProductDetailsView(viewModel: ProductDetailsViewModel(productId: "322"))
}
