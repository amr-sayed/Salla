//
//  BrandDetailsRepository.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 05/09/2024.
//

import Foundation
import Combine


class BrandDetailsRepository: BrandDetailsRepositoryContract {
    
    let service: BrandDetailsServiceContract
    
    init(service: BrandDetailsServiceContract = BrandDetailsService()) {
        self.service = service
    }
    
    func loadBrandDetails(page: Int, perPage: Int) -> AnyPublisher<BaseResponse<[Product]>, Error> {
        service.loadBrandDetails(page: page, perPage: perPage)
    }
    
    
}
