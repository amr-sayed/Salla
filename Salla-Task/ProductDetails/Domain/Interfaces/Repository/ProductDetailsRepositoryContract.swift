//
//  ProductDetailsRepositoryContract.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 06/09/2024.
//

import Combine

protocol ProductDetailsRepositoryContract {
    func loadProductDetails(productId: String) -> AnyPublisher<BaseResponse<ProductDetails>, BaseError>
}
