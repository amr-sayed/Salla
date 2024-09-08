//
//  ProductDetailsRealm.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 08/09/2024.
//

import Foundation
import RealmSwift

class ProductDetailsRealm: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var sku: String? = nil
    @objc dynamic var name: String? = nil
    @objc dynamic var productDescription: String? = nil
    @objc dynamic var url: String? = nil
    @objc dynamic var promotionTitle: String? = nil
    @objc dynamic var subtitle: String? = nil
    @objc dynamic var type: String? = nil
    @objc dynamic var status: String? = nil
    @objc dynamic var price: Double = 0.0
    @objc dynamic var regularPrice: Double = 0.0
    @objc dynamic var startingPrice: Double = 0.0
    @objc dynamic var quantity: Int = 0
    @objc dynamic var maxQuantity: Int = 0
    @objc dynamic var discountEnds: String = ""
    @objc dynamic var isTaxable: Bool = false
    @objc dynamic var isAvailable: Bool = false
    @objc dynamic var isOutOfStock: Bool = false
    @objc dynamic var isRequireShipping: Bool = false
    @objc dynamic var weight: String = ""
    @objc dynamic var calories: String = ""
    @objc dynamic var imageUrl: String? = nil
    @objc dynamic var imageAlt: String? = nil
    @objc dynamic var currency: String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
