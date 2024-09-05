//
//  MockValidBrandDetailsService.swift
//  Salla-TaskTests
//
//  Created by Amr Ahmed on 05/09/2024.
//

import Foundation
import Combine
@testable import Salla_Task


class MockValidBrandDetailsService: BrandDetailsServiceContract {
    func loadBrandDetails(page: Int, perPage: Int) -> AnyPublisher<BaseResponse<[Product]>, BaseError> {
        let response = BaseResponse<[Product]>(
            status: 200,
            success: true,
            data: MockData.products,
            cursor: MockData.cursor
        )
        return Just(response)
            .eraseToBaseError()
            .eraseToAnyPublisher()
    }
}
