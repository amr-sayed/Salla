//
//  NetworkConstants.swift
//  OneBank
//
//  Created by Karim Azmi on 05/07/2021.
//
import Foundation

public enum NetworkConstants {
    enum Range {
        static let statusCode = 200...299
    }
    
    static let retries: Int = 3
    static let baseUrl: String = getBaseUrl()
    
    static let timeoutIntervalForRequest: Double = 120
    private static func getBaseUrl() -> String {
        return "http://teamappapi.tlt.co.com/api/"
    }
}
