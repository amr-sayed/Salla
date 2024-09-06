//
//  ProductDetailsServiceTests.swift
//  Salla-TaskTests
//
//  Created by Amr Ahmed on 06/09/2024.
//

import XCTest
import Combine
@testable import Salla_Task

final class ProductDetailsServiceTests: XCTestCase {

    private var sut: ProdcutDetailsService!
    private var cancellables: Set<AnyCancellable>!
    private var expectationDesc: String!
    
    
    override func setUp() {
        expectationDesc = "prodcutDetailsServiceTests"
        cancellables = []
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
        
    }

    func testSUT_whenProductDetailsCalled_return_validResponse() {
        // Given
        let expectation = expectation(description: expectationDesc)
        let apiService = MockAPIService()
        apiService.fileName = "ProductDetailsMockResponse"
        
        sut = ProdcutDetailsService(apiService: apiService)
        
        // When
        let cancellable = sut
            .loadProductDetails(productId: MockData.productId)
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { completion in
                    guard case .finished = completion else { return }
                    expectation.fulfill()
                },
                receiveValue: {
                    XCTAssertNotNil($0)
                }
            )
        
        // Then
        waitForExpectations(timeout: 10)
        cancellable.cancel()
    }

}
