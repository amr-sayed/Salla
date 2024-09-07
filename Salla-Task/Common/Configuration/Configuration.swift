//
//  Configuration.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 07/09/2024.
//

import Foundation
struct Configuration: Decodable {
    
    let id: Int
    let store: String
    let appColor: UInt
    let fontFamily: String
    
    enum CodingKeys: String,CodingKey {
        case id
        case store
        case appColor = "app_color"
        case fontFamily = "font_family"
    }
    
    init()  {
       id = 0
        store = ""
        appColor = 0
        fontFamily = ""
    }
}
