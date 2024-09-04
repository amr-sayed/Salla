//
//  BaseResponse.swift
//  Lemonada
//
//  Created by Amr Elsayed on 03/07/2023.
//

import Foundation

struct BaseResponse: Decodable {
    var status: Int?
    var title: String?
    var Message: String?
}
