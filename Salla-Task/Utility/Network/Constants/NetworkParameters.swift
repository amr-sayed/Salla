//
//  NetworkParameters.swift
//  OneBank
//
//  Created by Karim Azmi on 05/07/2021.
//
import Foundation

/// Enumeration that represents type of Network Parameters
public typealias Parameters = [String: Any]
public enum RequestParams {
    case body(_: Parameters)
    case query(_: Parameters)
}
