//
//  Product.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 04/09/2024.
//

import Foundation

struct Product: Codable, Equatable {
  
    let id: String?
    let sku: String?
    let name: String?
    let description: String?
    let url: String?
    let promotionTitle: String?
    let subtitle: String?
    let type: String?
    let status: String?
    let price: Double?
    let regularPrice: Double?
    let startingPrice: Double?
    let quantity: Int?
    let maxQuantity: Int?
    let discountEnds: Int?
    let isTaxable: Bool?
    let hasReadMore: Bool?
    let canAddNote: Bool?
    let canShowRemainedQuantity: Bool?
    let canUploadFile: Bool?
    let hasCustomForm: Bool?
    let hasMetadata: Bool?
    let isOnSale: Bool?
    let isHiddenQuantity: Bool?
    let isAvailable: Bool?
    let isOutOfStock: Bool?
    let isRequireShipping: Bool?
    let weight: Double?
    let calories: Double?
    let image: ImageModel?
    let currency: String?
    
    init(
           id: String? = nil,
           sku: String? = nil,
           name: String? = nil,
           description: String? = nil,
           url: String? = nil,
           promotionTitle: String? = nil,
           subtitle: String? = nil,
           type: String? = nil,
           status: String? = nil,
           price: Double? = nil,
           regularPrice: Double? = nil,
           startingPrice: Double? = nil,
           quantity: Int? = nil,
           maxQuantity: Int? = nil,
           discountEnds: Int? = nil,
           isTaxable: Bool? = nil, // Required non-optional property
           hasReadMore: Bool? = nil,
           canAddNote: Bool? = nil,
           canShowRemainedQuantity: Bool? = nil,
           canUploadFile: Bool? = nil,
           hasCustomForm: Bool? = nil,
           hasMetadata: Bool? = nil,
           isOnSale: Bool? = nil,
           isHiddenQuantity: Bool? = nil,
           isAvailable: Bool? = nil,
           isOutOfStock: Bool? = nil,
           isRequireShipping: Bool? = nil,
           weight: Double? = nil,
           calories: Double? = nil,
           image: ImageModel? = nil,
           currency: String? = nil
       ) {
           self.id = id
           self.sku = sku
           self.name = name
           self.description = description
           self.url = url
           self.promotionTitle = promotionTitle
           self.subtitle = subtitle
           self.type = type
           self.status = status
           self.price = price
           self.regularPrice = regularPrice
           self.startingPrice = startingPrice
           self.quantity = quantity
           self.maxQuantity = maxQuantity
           self.discountEnds = discountEnds
           self.isTaxable = isTaxable
           self.hasReadMore = hasReadMore
           self.canAddNote = canAddNote
           self.canShowRemainedQuantity = canShowRemainedQuantity
           self.canUploadFile = canUploadFile
           self.hasCustomForm = hasCustomForm
           self.hasMetadata = hasMetadata
           self.isOnSale = isOnSale
           self.isHiddenQuantity = isHiddenQuantity
           self.isAvailable = isAvailable
           self.isOutOfStock = isOutOfStock
           self.isRequireShipping = isRequireShipping
           self.weight = weight
           self.calories = calories
           self.image = image
           self.currency = currency
       }
    
    enum CodingKeys: String,CodingKey {
        case id
        case sku
        case name
        case description
        case url
        case promotionTitle = "promotion_title"
        case subtitle
        case type
        case status
        case price
        case regularPrice = "regular_price"
        case startingPrice = "starting_price"
        case quantity
        case maxQuantity = "max_quantity"
        case discountEnds = "discount_ends"
        case isTaxable = "is_taxable"
        case hasReadMore = "has_read_more"
        case canAddNote = "can_add_Note"
        case canShowRemainedQuantity = "can_show_remained_quantity"
        case canUploadFile = "can_upload_file"
        case hasCustomForm = "has_custom_form"
        case hasMetadata = "has_metadata"
        case isOnSale = "is_on_Sale"
        case isHiddenQuantity = "is_hidden_quantity"
        case isAvailable = "is_available"
        case isOutOfStock = "is_out_of_Stock"
        case isRequireShipping = "is_require_shipping"
        case weight
        case calories
        case image
        case currency
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }
}
