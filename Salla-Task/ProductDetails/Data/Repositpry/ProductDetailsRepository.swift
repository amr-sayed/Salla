//
//  ProductDetailsRepository.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 06/09/2024.
//

import Combine

class ProductDetailsRepository: ProductDetailsRepositoryContract {
    
    let service: ProductDetailsServiceContract
    let realmManager: RealmManagerContract
    
    
    init(
        service: ProductDetailsServiceContract = ProdcutDetailsService(),
        realmManager: RealmManagerContract = RealmManager.shared
    ) {
        self.service = service
        self.realmManager = realmManager
    }
    
    func loadProductDetails(productId: String) -> AnyPublisher<BaseResponse<ProductDetails>, BaseError> {
        if NetworkMonitor.shared.isConnected {
            return service.loadProductDetails(productId: productId)
                .handleEvents(receiveOutput: { [weak self] response in
                    self?.realmManager.saveProductDetailsToRealm(productDetails: response.data)
                })
                .eraseToAnyPublisher()
                
        }else {
            let cachedProduct = realmManager.fetchProductDetails(productId: Int(productId) ?? 0)
            if cachedProduct != nil {
                let response = BaseResponse<ProductDetails>(
                    status: 200,
                    success: true,
                    data: cachedProduct ?? ProductDetails(),
                    cursor: Cursor(current: "", next: ""
                                  ))
                return Just(response)
                    .eraseToBaseError()
                    .eraseToAnyPublisher()
            }
        }
        return Just(BaseResponse<ProductDetails>(
            status: 200,
            success: true,
            data: ProductDetails(),
            cursor: Cursor(current: "", next: "")
        ))
        .eraseToBaseError()
        .eraseToAnyPublisher()
    }
}
