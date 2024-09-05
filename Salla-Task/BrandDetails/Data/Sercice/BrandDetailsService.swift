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

    
    init(apiService: APIServiceContract = APIService.shared) {
        self.apiService = apiService
    }
    
    
    func loadBrandDetails(page: Int, perPage: Int) -> AnyPublisher<BaseResponse<[Product]>, Error> {
       
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
        
        return apiService
            .request(
                using: request,
                responseType: BaseResponse<[Product]>.self
            )
    }
}
