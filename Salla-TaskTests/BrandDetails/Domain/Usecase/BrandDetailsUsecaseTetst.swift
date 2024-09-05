//
//  BrandDetailsUsecaseTetst.swift
//  Salla-TaskTests
//
//  Created by Amr Ahmed on 05/09/2024.
//

import XCTest
@testable import Salla_Task

final class BrandDetailsUsecaseTetst: XCTestCase {
    
    private var validService: MockValidBrandDetailsService!
    private var failureService: MockFailureBrandDetailsService!
    private var expectationDesc: String!
    
    override func setUp() {
        super.setUp()
        validService = MockValidBrandDetailsService()
        failureService = MockFailureBrandDetailsService()
        expectationDesc = "BrandDetailsUsecase"
    }
    
    override func tearDown() {
        validService = nil
        failureService = nil
        expectationDesc = nil
        super.tearDown()
    }
    
    func testSUT_whenInitCalled_defaultParametersAreSet() {
        // When
        let sut = BrandDetailsUsecase()
        
        // Then
        XCTAssertNotNil(sut.repository)
    }
    
    func testSUT_whenInitCalled_customParametersAreSet() {
        // When
        let sut = makeSut(using: validService)
        
        // Then
        XCTAssertNotNil(sut.repository)
    }
    
    func testSUT_whenExecutingUseCase_productList_greaterThanZero() {
        // Given
        let exp = expectation(description: expectationDesc)
        
        let sut = makeSut(using: validService)
        
        // When
        let cancellable = sut
            .excute(page: 1, perPage: 10)
            .receive(on: RunLoop.main)
            .sink { completion in
                guard case .failure(let error) = completion else { return }
                XCTFail("Expected to recieve value while validating nationalID instead of \(error)")
            } receiveValue: { response in
                XCTAssertTrue(response.data.count != 0)
                exp.fulfill()
            }
        
        // Then
        waitForExpectations(timeout: 1.0)
        XCTAssertNotNil(cancellable)
    }
    
    func testSUT_whenExecutingUseCase_whenFailed_baseErrorRrecieved() {
        // Given
        let exp = expectation(description: expectationDesc)
        
        let sut = makeSut(using: failureService)
        
        // When
        let cancellable = sut
            .excute(page: 1, perPage: 10)
            .sink { completion in
                guard case .failure(let error) = completion else { return }
                XCTAssertEqual(error, MockData.internalServerError)
                exp.fulfill()
            } receiveValue: { response in
                XCTFail("Expected to recieve error while validating accountNumber instead of recieving \(String(describing: response))")
            }
        
        // Then
        waitForExpectations(timeout: 1.0)
        XCTAssertNotNil(cancellable)
    }
    
    private func makeSut(using service: BrandDetailsServiceContract) -> BrandDetailsUsecase {
        let repository = BrandDetailsRepository(service: service)
        return BrandDetailsUsecase(repository: repository)
    }
    
}
