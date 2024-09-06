//
//  MockAPIService.swift
//  Salla-TaskTests
//
//  Created by Amr Ahmed on 05/09/2024.
//


import Foundation
import Combine
@testable import Salla_Task

class MockAPIService: APIServiceContract {
    
    var fileName: String = ""

    func request<T>(
        using request: URLRequest,
        responseType: T.Type,
        decoder: JSONDecoder,
        retry: Int) -> AnyPublisher<BaseResponse<T>, BaseError> where T : Decodable {
        
            // get file path
            let testBundle = Bundle(for: type(of: self))
            guard let path = testBundle.path(forResource: fileName, ofType: "json") else {
                fatalError("please add \(fileName).json")
            }
            let fileURL = URL(fileURLWithPath: path)
            
            do {
                let data = try Data(contentsOf: fileURL)
                let response = try decoder.decode(BaseResponse<T>.self, from: data)
                
                return Just(response)
                    .eraseToBaseError()
                    .eraseToAnyPublisher()
            } catch {
                return Future<BaseResponse<T>, BaseError> { promise in
                    promise(.failure(MockData.invalidMapping))
                }
                .eraseToAnyPublisher()
            }
    }
}


