//
//  APIServiceContract.swift
//  OneBank
//
//  Created by ahmed ashraf on 15/11/2021.
//  Copyright © 2021 Atos. All rights reserved.
//

import Foundation
import Combine

protocol APIServiceContract {
    // MARK: - request API Service
    func request<T: Decodable>(
        using request: URLRequest,
        responseType: T.Type,
        decoder: JSONDecoder,
        retry: Int
    ) -> AnyPublisher<T, Error>
    
}

// MARK: - APIServiceContract+Handle request func default values
extension APIServiceContract {
    func request<T: Decodable>(
        using request: URLRequest,
        responseType: T.Type
    ) -> AnyPublisher<T, Error> {
        self.request(
            using: request,
            responseType: responseType,
            decoder: JSONDecoder(),
            retry: NetworkConstants.retries
        )
    }
}
