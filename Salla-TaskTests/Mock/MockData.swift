

@testable import Salla_Task
import Foundation
import Combine
import CoreLocation

enum MockData {
    
    static let invalidMapping = ErrorResolver.shared.getError(for: .mapping)
    
    static let productId: String = "599203108"
    
    static let products = [Product(
        id: "304266723",
        sku: nil,
        name: "توكة تنعيم",
        description: "",
        url: "https://jalmatari.com/ar/xAeVqBb",
        promotionTitle: nil,
        subtitle: "غطاء حماية مذهل للهاتف",
        type: "codes",
        status: "sale",
        price: 115,
        regularPrice: 115,
        startingPrice: 11.5,
        quantity: 156,
        maxQuantity: 156,
        discountEnds: nil,
        isTaxable: true,
        hasReadMore: false,
        canAddNote: false,
        canShowRemainedQuantity: true,
        canUploadFile: false,
        hasCustomForm: false,
        hasMetadata: false,
        isOnSale: false,
        isHiddenQuantity: false,
        isAvailable: true,
        isOutOfStock: false,
        isRequireShipping: false,
        weight: nil,
        calories: nil,
        image: ImageModel(
            url: "https://cdn.salla.sa/ydZbx/8f14a689-99d5-4df7-bfe8-0f1568383963-500x341.83673469388-kmz8WtSQD5xNXY3SIhk4LG6ZvyQaWw6zyOmFO8MV.png"
        ),
        currency: "SAR"
    )]
    
   static let productDetails = ProductDetails(
        id: 599203108,
        sku: nil,
        name: "مع حقول مخصصة",
        description: "",
        url: "https://jalmatari.com/ar/NKRoQbq",
        promotionTitle: nil,
        subtitle: nil,
        type: "product",
        status: "sale",
        price: 115.0,
        baseCurrencyPrice: CurrencyPrice(currency: "SAR", amount: 115.0),
        salePrice: 0.0,
        regularPrice: 115.0,
        startingPrice: nil,
        quantity: nil,
        maxQuantity: 500,
        discountEnds: nil,
        isTaxable: true,
        hasReadMore: false,
        canAddNote: false,
        canShowRemainedQuantity: false,
        canUploadFile: false,
        hasCustomForm: false,
        hasMetadata: false,
        isOnSale: false,
        isHiddenQuantity: false,
        isAvailable: true,
        isOutOfStock: false,
        isRequireShipping: true,
        weight: "0.1 كجم",
        calories: nil,
        image: ProductImage(url: "https://cdn.salla.sa/ydZbx/73dc7c69-5797-497e-ab62-76382dd43619-350.06784260516x500-KoNbg8Xf84F5Z3nsV5h8IJWuYbzyc0sHQ6UohJNc.jpg", alt: "مع حقول مخصصة"),
        currency: "SAR"
    )
    static let cursor = Cursor(current: "1", next: "")
   
    static let internalServerError = BaseError(
        code: 500,
        type: .wrappedHttpServer,
        message: "Internal Server Error"
    )
}
