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
    
    
    func fetchProductDetails(productId: Int) -> ProductDetails? {
        let realm = try! Realm()
        
        // Try to fetch the product from Realm
        if let cachedProduct = realm.object(ofType: ProductDetailsRealm.self, forPrimaryKey: productId) {
            // Convert to the struct model
            let productDetails = convertToProductDetails(from: cachedProduct)
            return productDetails
        }
        return nil
    }
    
    func saveProductDetailsToRealm(productDetails: ProductDetails) {
        let realm = try! Realm()
        
        let productRealm = convertToProductDetailsRealm(from: productDetails)
        
        try! realm.write {
            realm.add(productRealm, update: .all)
        }
    }
    
    func convertToProductDetails(from realmProduct: ProductDetailsRealm) -> ProductDetails {
        return ProductDetails(
            id: realmProduct.id,
            sku: realmProduct.sku,
            name: realmProduct.name,
            description: realmProduct.productDescription,
            url: realmProduct.url,
            promotionTitle: realmProduct.promotionTitle,
            subtitle: realmProduct.subtitle,
            type: realmProduct.type,
            status: realmProduct.status,
            price: realmProduct.price,
            regularPrice: realmProduct.regularPrice,
            startingPrice: realmProduct.startingPrice,
            quantity: realmProduct.quantity,
            maxQuantity: realmProduct.maxQuantity,
            discountEnds: realmProduct.discountEnds,
            isTaxable: realmProduct.isTaxable,
            hasReadMore: false,
            canAddNote: false,
            canShowRemainedQuantity: false,
            canUploadFile: false,
            hasCustomForm: false,
            hasMetadata: false,
            isOnSale: false,
            isHiddenQuantity: false,
            isAvailable: realmProduct.isAvailable,
            isOutOfStock: realmProduct.isOutOfStock,
            isRequireShipping: realmProduct.isRequireShipping,
            weight: realmProduct.weight,
            calories: realmProduct.calories,
            image: ProductImage(url: realmProduct.imageUrl, alt: realmProduct.imageAlt),
            currency: realmProduct.currency
        )
    }
    
    func convertToProductDetailsRealm(from productDetails: ProductDetails) -> ProductDetailsRealm {
        let productRealm = ProductDetailsRealm()
        productRealm.id = productDetails.id ?? 0
        productRealm.sku = productDetails.sku
        productRealm.name = productDetails.name
        productRealm.productDescription = productDetails.description
        productRealm.url = productDetails.url
        productRealm.promotionTitle = productDetails.promotionTitle
        productRealm.subtitle = productDetails.subtitle
        productRealm.type = productDetails.type
        productRealm.status = productDetails.status
        productRealm.price = productDetails.price ?? 0
        productRealm.regularPrice = productDetails.regularPrice ?? 0
        productRealm.startingPrice = productDetails.startingPrice ?? 0
        productRealm.quantity = productDetails.quantity ?? 0
        productRealm.maxQuantity = productDetails.maxQuantity ?? 0
        productRealm.discountEnds = productDetails.discountEnds ?? ""
        productRealm.isTaxable = productDetails.isTaxable ?? false
        productRealm.isAvailable = productDetails.isAvailable ?? false
        productRealm.isOutOfStock = productDetails.isOutOfStock ?? false
        productRealm.isRequireShipping = productDetails.isRequireShipping ?? false
        productRealm.weight = productDetails.weight ?? "0.0"
        productRealm.calories = productDetails.calories ?? "0.0"
        productRealm.imageUrl = productDetails.image?.url
        productRealm.imageAlt = productDetails.image?.alt
        productRealm.currency = productDetails.currency
        return productRealm
    }
}
