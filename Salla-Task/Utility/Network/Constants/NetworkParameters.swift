//
//  NetworkParameters.swift
//  OneBank
//
//  Created by Karim Azmi on 05/07/2021.
//
import Foundation

/// Enumeration that represents type of Network Parameters
public typealias Parameters = [String: Any]
public typealias Parameters2 = [[String: Any]]
public enum RequestParams {
    case body(_: Parameters)
    case body2(_: Parameters2)
    case query(_: Parameters)
}
