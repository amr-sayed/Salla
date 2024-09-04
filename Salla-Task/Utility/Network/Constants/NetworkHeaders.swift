//
//  NetworkHeaders.swift
//  OneBank
//
//  Created by Karim Azmi on 05/07/2021.
//
import Foundation

/// Enumeration that represents types of Network Headers
public typealias HTTPHeaders = [String: String]
public enum HTTPHeader {
    static let contentType = "Content-Type"
    static let authentication = "Authorization"
 
}
