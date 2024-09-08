//
//  ProductRealm.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 08/09/2024.
//

import RealmSwift

class ProductRealm: Object {
    @Persisted(primaryKey: true) var id: String? = ""
    @Persisted var sku: String? = ""
    @Persisted var name: String? = ""
    @Persisted var productDescription: String? = ""
    @Persisted var url: String? = ""
    @Persisted var promotionTitle: String? = ""
    @Persisted var subtitle: String? = ""
    @Persisted var type: String? = ""
    @Persisted var status: String? = ""
    @Persisted var price: Double = 0.0
    @Persisted var regularPrice: Double = 0.0
    @Persisted var startingPrice: Double = 0.0
    @Persisted var quantity: Int = 0
    @Persisted var maxQuantity: Int = 0
    @Persisted var discountEnds: Int = 0
    @Persisted var isTaxable: Bool = false
    @Persisted var hasReadMore: Bool = false
    @Persisted var canAddNote: Bool = false
    @Persisted var canShowRemainedQuantity: Bool = false
    @Persisted var canUploadFile: Bool = false
    @Persisted var hasCustomForm: Bool = false
    @Persisted var hasMetadata: Bool = false
    @Persisted var isOnSale: Bool = false
    @Persisted var isHiddenQuantity: Bool = false
    @Persisted var isAvailable: Bool = false
    @Persisted var isOutOfStock: Bool = false
    @Persisted var isRequireShipping: Bool = false
    @Persisted var weight: Double = 0.0
    @Persisted var calories: Double = 0.0
    @Persisted var currency: String? = ""
    @Persisted var image: ImageModelRealm?
}

class ImageModelRealm: Object {
    @Persisted var url: String? = ""
}
