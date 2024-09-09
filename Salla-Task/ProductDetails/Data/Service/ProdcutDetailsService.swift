//
//  ProdcutDetailsService.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 06/09/2024.
//

import Combine

class ProdcutDetailsService: ProductDetailsServiceContract {
    
    var apiService: APIServiceContract
    var realmManager: RealmManagerContract
    
    
    
    init(
        apiService: APIServiceContract = APIService.shared,
        realmManager: RealmManagerContract = RealmManager.shared
    ) {
        self.apiService = apiService
        self.realmManager = realmManager
    }
    
    func loadProductDetails(productId: String) -> AnyPublisher<BaseResponse<ProductDetails>, BaseError> {
        
        let headers: HTTPHeaders = [
            "Currency": "SAR",
            "AppVersion": "3.0.0",
            "Store-Identifier": "\(ConfigurationManager.shared.loadIdentifier())",
        ]
        let request = APIBuilder()
            .setPath(using: .productDetails, argument: productId)
            .setMethod(using: .get)
            .setHeaders(using: headers)
            .build()
        
        return apiService
            .request(
                using: request,
                responseType: ProductDetails.self
            )
    }
}
