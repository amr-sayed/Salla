//
//  MockValidBrandDetailsService.swift
//  Salla-TaskTests
//
//  Created by Amr Ahmed on 05/09/2024.
//

import Foundation
import Combine
@testable import Salla_Task


class MockValidProductDetailsService: ProductDetailsServiceContract {
    
    func loadProductDetails(productId: String) -> AnyPublisher<BaseResponse<ProductDetails>, BaseError> {
        let response = BaseResponse<ProductDetails>(
            status: 200,
            success: true,
            data: MockData.productDetails,
            cursor: MockData.cursor
        )
        return Just(response)
            .eraseToBaseError()
            .eraseToAnyPublisher()
    }
}
