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
    let realmManager: RealmManagerContract
    
    var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(
        service: BrandDetailsServiceContract = BrandDetailsService(),
        realmManager: RealmManagerContract = RealmManager.shared
        
    ) {
        self.service = service
        self.realmManager = realmManager
    }
    
    func loadBrandDetails(page: Int, perPage: Int) -> AnyPublisher<BaseResponse<[Product]>, BaseError> {
        
        if NetworkMonitor.shared.isConnected {
            return service.loadBrandDetails(page: page, perPage: perPage)
                .handleEvents(receiveOutput: { [weak self] response in
                    self?.realmManager.cacheProductData(response.data)
                })
                .eraseToAnyPublisher()
            
        }else {
            let cachedProducts = realmManager.getCachedProducts()
            if cachedProducts.count > 0 {
                let response = BaseResponse<[Product]>(
                    status: 200,
                    success: true,
                    data: cachedProducts,
                    cursor: Cursor(current: "", next: "")
                )
                return Just(response)
                    .eraseToBaseError()
                    .eraseToAnyPublisher()
            }
        }
        return Just(BaseResponse<[Product]>(
            status: 200,
            success: true,
            data: [],
            cursor: Cursor(current: "", next: "")
        ))
        .eraseToBaseError()
        .eraseToAnyPublisher()
    }
}
