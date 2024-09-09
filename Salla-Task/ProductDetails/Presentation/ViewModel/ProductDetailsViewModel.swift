//
//  ProductDetailsViewModel.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 06/09/2024.
//

import Foundation

class ProductDetailsViewModel: BaseViewModel {
    
    @Published var  product: ProductDetails = .init()
    
    private let usecase: ProductDetailsUsecaseContract
    private var productId: String
    
    init(
        usecase: ProductDetailsUsecaseContract = ProductDetailsUsecase(),
        productId: String
    ) {
        self.usecase = usecase
        self.productId = productId
        super.init()
        loadProductDetails()
    }
    
    func loadProductDetails() {
        isLoading = true
        usecase
            .excute(productId: productId)
            .receive(on: RunLoop.main)
            .sink { completion in
                guard case .failure(let error) = completion else { return }
                print("error \(error)")
            } receiveValue: { [weak self] response  in
                guard let self = self else { return }
                self.handleSuccessProductDetails(response)
            }
            .store(in: &cancellables)
    }
    
    func handleSuccessProductDetails(_ response: BaseResponse<ProductDetails>) {
        isLoading = false
        product = response.data
    }
}
