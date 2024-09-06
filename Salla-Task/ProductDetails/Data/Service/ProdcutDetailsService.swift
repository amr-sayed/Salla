//
//  ProdcutDetailsService.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 06/09/2024.
//

import Combine

class ProdcutDetailsService: ProductDetailsServiceContract {
    
    var apiService: APIServiceContract

    
    init(apiService: APIServiceContract = APIService.shared) {
        self.apiService = apiService
    }
    
    func loadProductDetails(productId: String) -> AnyPublisher<BaseResponse<ProductDetails>, BaseError> {
        
        let headers: HTTPHeaders = [
            "Currency": "SAR",
            "AppVersion": "3.0.0",
            "Store-Identifier": "1328842359",
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
