//
//  BaseResponse.swift
//  Lemonada
//
//  Created by Amr Elsayed on 03/07/2023.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable  {
    var status: Int
    var success: Bool
    var data: T
    let cursor: Cursor?
}

struct Cursor: Decodable {
    let current: String
    let next: String?
}
