//
//  RealmManager.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 08/09/2024.
//

import RealmSwift

class RealmManager: RealmManagerContract {
    
    static let shared = RealmManager()
    
    private init() {}
    
    func cacheProductData(_ products: [Product]) {
        let realm = try! Realm()
        try! realm.write {
            for product in products {
                let productRealm = convertProductToRealm(product: product)
                realm.add(productRealm, update: .modified)
            }
        }
    }
    
    func getCachedProducts() -> [Product] {
        let realm = try! Realm()
        let realmProducts = Array(realm.objects(ProductRealm.self))
        var prosucts: [Product] = .init()
        for item in realmProducts {
            prosucts.append(convertRealmToProduct(productRealm: item))
        }
        return prosucts
    }
    
    func convertProductToRealm(product: Product) -> ProductRealm {
        let productRealm = ProductRealm()
        productRealm.id = product.id
        productRealm.sku = product.sku
        productRealm.name = product.name
        productRealm.productDescription = product.description
        productRealm.url = product.url
        productRealm.promotionTitle = product.promotionTitle
        productRealm.subtitle = product.subtitle
        productRealm.type = product.type
        productRealm.status = product.status
        productRealm.price = product.price ?? 0.0
        productRealm.regularPrice = product.regularPrice ?? 0.0
        productRealm.startingPrice = product.startingPrice ?? 0.0
        productRealm.quantity = product.quantity ?? 0
        productRealm.maxQuantity = product.maxQuantity ?? 0
        productRealm.discountEnds = product.discountEnds ?? 0
        productRealm.isTaxable = product.isTaxable ?? false
        productRealm.hasReadMore = product.hasReadMore ?? false
        productRealm.canAddNote = product.canAddNote ?? false
        productRealm.canShowRemainedQuantity = product.canShowRemainedQuantity ?? false
        productRealm.canUploadFile = product.canUploadFile ?? false
        productRealm.hasCustomForm = product.hasCustomForm ?? false
        productRealm.hasMetadata = product.hasMetadata ?? false
        productRealm.isOnSale = product.isOnSale ?? false
        productRealm.isHiddenQuantity = product.isHiddenQuantity ?? false
        productRealm.isAvailable = product.isAvailable ?? false
        productRealm.isOutOfStock = product.isOutOfStock ?? false
        productRealm.isRequireShipping = product.isRequireShipping ?? false
        productRealm.weight = product.weight ?? 0.0
        productRealm.calories = product.calories ?? 0.0
        productRealm.currency = product.currency
        if let image = product.image {
            let imageRealm = ImageModelRealm()
            imageRealm.url = image.url
            productRealm.image = imageRealm
        }
        return productRealm
    }
    
    func convertRealmToProduct(productRealm: ProductRealm) -> Product {
        return Product(
            id: productRealm.id,
            sku: productRealm.sku,
            name: productRealm.name,
            description: productRealm.productDescription,
            url: productRealm.url,
            promotionTitle: productRealm.promotionTitle,
            subtitle: productRealm.subtitle,
            type: productRealm.type,
            status: productRealm.status,
            price: productRealm.price,
            regularPrice: productRealm.regularPrice,
            startingPrice: productRealm.startingPrice,
            quantity: productRealm.quantity,
            maxQuantity: productRealm.maxQuantity,
            discountEnds: productRealm.discountEnds,
            isTaxable: productRealm.isTaxable,
            hasReadMore: productRealm.hasReadMore,
            canAddNote: productRealm.canAddNote,
            canShowRemainedQuantity: productRealm.canShowRemainedQuantity,
            canUploadFile: productRealm.canUploadFile,
            hasCustomForm: productRealm.hasCustomForm,
            hasMetadata: productRealm.hasMetadata,
            isOnSale: productRealm.isOnSale,
            isHiddenQuantity: productRealm.isHiddenQuantity,
            isAvailable: productRealm.isAvailable,
            isOutOfStock: productRealm.isOutOfStock,
            isRequireShipping: productRealm.isRequireShipping,
            weight: productRealm.weight,
            calories: productRealm.calories,
            image: productRealm.image != nil ? ImageModel(url: productRealm.image?.url) : nil,
            currency: productRealm.currency
        )
    }
}
