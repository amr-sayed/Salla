//
//  ProductDetailsUsecase.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 06/09/2024.
//

import Combine

class ProductDetailsUsecase: ProductDetailsUsecaseContract {
    
    let repository: ProductDetailsRepositoryContract
    
    init(repository: ProductDetailsRepositoryContract = ProductDetailsRepository()) {
        self.repository = repository
    }
    
    func excute(productId: String) -> AnyPublisher<BaseResponse<ProductDetails>, BaseError> {
        return  repository.loadProductDetails(productId: productId)
    }    
}
