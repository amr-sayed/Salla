//
//  MockInValidBrandDetailsService.swift
//  Salla-TaskTests
//
//  Created by Amr Ahmed on 05/09/2024.
//

import Combine

@testable import Salla_Task

class MockFailureBrandDetailsService: BrandDetailsServiceContract {
    
    func loadBrandDetails(page: Int, perPage: Int) -> AnyPublisher<BaseResponse<[Product]>, BaseError> {
        Future<BaseResponse<[Product]>, BaseError> { promise in
            promise(.failure(MockData.internalServerError))
        }
        .eraseToAnyPublisher()
    }
}
