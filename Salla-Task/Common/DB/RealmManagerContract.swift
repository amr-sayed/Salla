//
//  RealmManagerContract.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 08/09/2024.
//

import Foundation

protocol RealmManagerContract {
    
    func cacheProductData(_ products: [Product])
    
    func getCachedProducts() -> [Product]
    
    func convertProductToRealm(product: Product) -> ProductRealm
    
    func convertRealmToProduct(productRealm: ProductRealm) -> Product
    
    func convertToProductDetails(from realmProduct: ProductDetailsRealm) -> ProductDetails
    
    func convertToProductDetailsRealm(from productDetails: ProductDetails) -> ProductDetailsRealm
    
    func saveProductDetailsToRealm(productDetails: ProductDetails)
    
    func fetchProductDetails(productId: Int) -> ProductDetails?

}
