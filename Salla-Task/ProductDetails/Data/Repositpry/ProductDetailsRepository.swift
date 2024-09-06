//
//  ProductDetailsRepository.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 06/09/2024.
//

import Combine

class ProductDetailsRepository: ProductDetailsRepositoryContract {
    
    let service: ProductDetailsServiceContract
   
    init(service: ProductDetailsServiceContract = ProdcutDetailsService()) {
        self.service = service
    }

    func loadProductDetails(productId: String) -> AnyPublisher<BaseResponse<ProductDetails>, BaseError> {
        service.loadProductDetails(productId: productId)
    }
}
