//
//  APIService.swift
//  OneBank
//
//  Created by Karim Azmi on 05/07/2021.
//
import Foundation
import Combine
import Security

/// Singleton Class to handle Network Requests
final class APIService: NSObject,
                        APIServiceContract, URLSessionDelegate{
    /// Singleton instance of APIService class
    static let shared = APIService()
    
    let progressSubject: PassthroughSubject<(id: Int, progress: Double), Never>
    
    private(set) lazy var session: URLSession = {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = NetworkConstants.timeoutIntervalForRequest
        return URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
    }()
    
    private let serviceQueue: DispatchQueue
    //    private let certificates: [String: String]
    
    private override init() {
        self.progressSubject = .init()
        self.serviceQueue = .init(
            label: "com.natsolutions.Lemonada.service",
            qos: .userInteractive,
            attributes: .concurrent
        )
        super.init()
    }
    
    func request<T: Decodable>(using request: URLRequest,
                               responseType: T.Type = T.self,
                               decoder: JSONDecoder = .init(),
                               retry: Int = NetworkConstants.retries) -> AnyPublisher<T, ApiError> {
        
        print("APIService will call request", request)
        
        return session.dataTaskPublisher(for: request)
            .retry(retry)
            .print()
            .tryMap { output in
                var errorResult =  ApiError()
                var data = Data()
                if let response = output.response as? HTTPURLResponse {
                  
                    do {
                        errorResult = try decoder.decode(ApiError.self, from: output.data)
                        print(errorResult)
                    } catch let DecodingError.typeMismatch(type, context) {
                        print("Type '\(type)' mismatch:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch {
                        print("Decoding error: \(error)")
                    }
                    if errorResult.Status != true {
                        throw errorResult
                    } else{
                        data = output.data
                    }
                }
                return data
            }
            .mapError{ error in
                return error
            }
            .receive(on: serviceQueue)
            .decode(type: T.self, decoder: decoder)
            .mapError(handleError(using:))
            .eraseToAnyPublisher()
    }
    
    func handleError(using error: Error) -> ApiError {
        print("APIService did throw error", error)
        guard let error = error as? ApiError else { return
            ApiError(title: "unexpected", Status: false)
        }
        return error
    }
}

struct ApiError: Decodable, Error {
    var Message: String?
    var Status: Bool?
    init() {
        Message = ""
        Status = false
    }
    
    init(title: String, Status: Bool){
        self.Message = title
        self.Status = Status
    }
}
