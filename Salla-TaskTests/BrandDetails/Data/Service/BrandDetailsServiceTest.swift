//
//  BrandDetailsServiceTest.swift
//  Salla-TaskTests
//
//  Created by Amr Ahmed on 05/09/2024.
//

import XCTest
import Combine
@testable import Salla_Task

final class BrandDetailsServiceTest: XCTestCase {
    
    private var sut: BrandDetailsService!
    private var cancellables: Set<AnyCancellable>!
    private var expectationDesc: String!
    
    
    override func setUp() {
        expectationDesc = "brandDetailsServiceTests"
        cancellables = []
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
        
    }

    func testSUT_whenBrandDetailsCalled_return_validResponse() {
        // Given
        let expectation = expectation(description: expectationDesc)
        let apiService = MockAPIService()
        apiService.fileName = "BrandDetailsMockResponse"
        
        sut = BrandDetailsService(apiService: apiService)
        
        // When
        let cancellable = sut
            .loadBrandDetails(page: 1, perPage: 10)
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
