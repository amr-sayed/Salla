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
    

}
