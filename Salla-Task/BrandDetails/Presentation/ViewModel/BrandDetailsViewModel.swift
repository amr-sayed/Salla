//
//  BrandDetailsViewModel.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 04/09/2024.
//

import Foundation

class BrandDetailsViewModel: BaseViewModel {
    
    @Published var productList: [Product] = .init()
    @Published var selectedProduct: Product? = nil 

    private let brandDetailsUsecase:  BrandDetailsUsecaseContract
    private var hasMoreData = true
    private var currentPage = 1
    
    init(
        brandDetailsUsecase:  BrandDetailsUsecaseContract = BrandDetailsUsecase(),
        realmManager: RealmManagerContract = RealmManager.shared
    ) {
        self.brandDetailsUsecase = brandDetailsUsecase
        super.init()
        loadBrandProducts()
    }
    
    func loadMoreProducts() {
        if hasMoreData {
            currentPage += 1
            loadBrandProducts()
        }
    }
    
    func loadBrandProducts() {
        isLoading = true
        brandDetailsUsecase
            .excute(page: currentPage, perPage: 10)
            .receive(on: RunLoop.main)
            .sink { completion in
                guard case .failure(let error) = completion else { return }
                print("error \(error)")
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.handleSuccessBrandDetails(response)
            }
            .store(in: &cancellables)
    }
    
    func handleSuccessBrandDetails(_ response: BaseResponse<[Product]>) {
        isLoading = false
        productList.append(contentsOf: response.data)
        if response.cursor?.next != nil {
            hasMoreData = true
        }else {
            hasMoreData = false
        }
    }
}



