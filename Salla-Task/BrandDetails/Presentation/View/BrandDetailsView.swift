//
//  BrandDetailsView.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 04/09/2024.
//

import SwiftUI

struct BrandDetailsView: View {
    @StateObject var viewModel: BrandDetailsViewModel = BrandDetailsViewModel()
    @State var shouldShowProductDetails: Bool = false
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: Spacing.spacing_20) {
                ForEach(viewModel.productList, id: \.id) { item in
                    NavigationLink(
                            destination: ProductDetailsView(
                                viewModel: ProductDetailsViewModel(productId: item.id ?? .empty)
                            ),
                            tag: item,
                            selection: $viewModel.selectedProduct
                        ){
                        ProductView(product: item)
                            .onTapGesture {
                                viewModel.selectedProduct = item
                            }
                            .onAppear {
                                if item == viewModel.productList.last {
                                    viewModel.loadMoreProducts()
                                }
                            }
                    }
                }
            }
            .padding(.horizontal)
            
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            }
        }
    }
}


#Preview {
    BrandDetailsView()
}

