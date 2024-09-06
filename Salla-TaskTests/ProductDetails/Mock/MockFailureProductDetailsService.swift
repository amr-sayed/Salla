//
//  MockInValidBrandDetailsService.swift
//  Salla-TaskTests
//
//  Created by Amr Ahmed on 05/09/2024.
//

import Combine

@testable import Salla_Task

class MockFailureProductDetailsService: ProductDetailsServiceContract {
    
    
    func loadProductDetails(productId: String) -> AnyPublisher<BaseResponse<ProductDetails>, BaseError> {
        Future<BaseResponse<ProductDetails>, BaseError> { promise in
            promise(.failure(MockData.internalServerError))
        }
        .eraseToAnyPublisher()
    }
}
