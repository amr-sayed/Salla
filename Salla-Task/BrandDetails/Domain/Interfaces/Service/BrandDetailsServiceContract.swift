//
//  BrandDetailsServiceContract.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 05/09/2024.
//

import Combine

protocol BrandDetailsServiceContract {
    func loadBrandDetails(page: Int, perPage: Int) ->
        AnyPublisher<BaseResponse<[Product]>, BaseError>
}
