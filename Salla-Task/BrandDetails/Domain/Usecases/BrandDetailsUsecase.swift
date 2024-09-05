//
//  BrandDetailsUsecase.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 05/09/2024.
//

import Foundation
import Combine

class BrandDetailsUsecase: BrandDetailsUsecaseContract {
    
    let repository: BrandDetailsRepositoryContract
    
    
    init(repository: BrandDetailsRepositoryContract = BrandDetailsRepository()) {
        self.repository = repository
    }

    func excute(page: Int, perPage: Int) -> AnyPublisher<BaseResponse<[Product]>, BaseError> {
        
        return self.repository
            .loadBrandDetails(page: page, perPage: perPage)
            .eraseToAnyPublisher()
    }
}
