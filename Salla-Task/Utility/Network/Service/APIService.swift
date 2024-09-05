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
            label: "com.Salla",
            qos: .userInteractive,
            attributes: .concurrent
        )
        super.init()
    }
    
    func request<T: Decodable>(using request: URLRequest,
                               responseType: T.Type = T.self,
                               decoder: JSONDecoder = .init(),
                               retry: Int = NetworkConstants.retries) -> AnyPublisher<BaseResponse<T>, BaseError> {
        
        print("APIService will call request", request)
        
        return session.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let httpResponse = output.response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: BaseResponse<T>.self, decoder: decoder)
            .mapError(handleError(using:))
            .receive(on: serviceQueue)
            .eraseToAnyPublisher()
    }
    
    func handleError(using error: Error) -> BaseError {
        print("APIService did throw error", error)
        
        switch error {
        case URLError.networkConnectionLost,
            URLError.notConnectedToInternet:
            return ErrorResolver.shared.getError(for: .connection)
            
        case is URLError:
            return ErrorResolver.shared.getError(for: .unwrappedHttpServer)
            
        case is DecodingError:
            return ErrorResolver.shared.getError(for: .mapping)
            
        default:
            guard let error = error as? BaseError else { return
                ErrorResolver.shared.getError(for: .unexpected)
            }
            return error
        }
    }
}
