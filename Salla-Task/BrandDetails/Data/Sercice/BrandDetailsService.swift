//
//  BrandDetailsService.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 05/09/2024.
//

import Foundation
import Combine

class BrandDetailsService: BrandDetailsServiceContract {
    
    var apiService: APIServiceContract
    var realmManager: RealmManagerContract
    
    
    init(
        apiService: APIServiceContract = APIService.shared,
        realmManager: RealmManagerContract = RealmManager.shared
    ) {
        self.apiService = apiService
        self.realmManager = realmManager
    }
    
    
    func loadBrandDetails(page: Int, perPage: Int) -> AnyPublisher<BaseResponse<[Product]>, BaseError> {
        
        let headers: HTTPHeaders = [
            "Currency": "SAR",
            "AppVersion": "3.0.0",
            "Store-Identifier": "1328842359",
        ]
        let requestObj = BrandDetailsRequest(page: page, per_page: perPage)
        
        let request = APIBuilder()
            .setPath(using: .brandDetails)
            .setMethod(using: .get)
            .setParameters(using: .query(requestObj.dictionary))
            .setHeaders(using: headers)
            .build()
        
        if NetworkMonitor.shared.isConnected {
            return apiService
                .request(
                    using: request,
                    responseType: [Product].self
                )
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
