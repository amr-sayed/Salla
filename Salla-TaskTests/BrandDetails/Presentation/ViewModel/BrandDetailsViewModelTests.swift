//
//  BrandDetailsViewModelTests.swift
//  Salla-TaskTests
//
//  Created by Amr Ahmed on 05/09/2024.
//

import XCTest
@testable import Salla_Task

final class BrandDetailsViewModelTests: XCTestCase {
    
    private var validService: MockValidBrandDetailsService!
    private var failureService: MockFailureBrandDetailsService!
    private var sut: BrandDetailsViewModel!
    private var expectationDesc: String!
    
    override func setUp() {
        super.setUp()
        sut = BrandDetailsViewModel()
        validService = MockValidBrandDetailsService()
        failureService = MockFailureBrandDetailsService()
        expectationDesc = "ValidateBrandDetailsViewModel"
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_whenInitCalled_defaultParametersAreSet_accountNumberIsEmpty() {
        XCTAssertTrue(sut.productList.isEmpty)
    }
    
    func testSUT_whenLoadBrandProducts_baseErrorRecieved() {
        // Given
        let sut = makeSut(using: failureService)
        let exp = expectation(description: expectationDesc)
        
        // When
        sut.loadBrandProducts()
        sut.$isLoading
            .sink(receiveCompletion: { _ in
                exp.fulfill()
            }, receiveValue: {
                if $0 != false {
                    exp.fulfill()
                }
            })
            .store(in: &sut.cancellables)
        
        // Then
        waitForExpectations(timeout: 1.0)
        XCTAssertNotNil(sut.cancellables)
    }
    
    func testSUT_whenLoadBrandProducts_responsePhoneNumberNotEmpty() {
        // Given
        let sut = makeSut(using: validService)
        let exp = expectation(description: expectationDesc)
        
        // When
        sut.loadBrandProducts()
        sut.$productList
            .sink(receiveValue: { products in
                if sut.productList.count > 0 {
                    exp.fulfill()
                }
            })
            
            .store(in: &sut.cancellables)
        
        // Then
        waitForExpectations(timeout: 1.0)
        XCTAssertTrue(sut.productList.count > 0)
    }
    
    private func makeSut(using service: BrandDetailsServiceContract) -> BrandDetailsViewModel {
        let repository = BrandDetailsRepository(service: service)
        let useCase = BrandDetailsUsecase(repository: repository)
        
        return BrandDetailsViewModel(brandDetailsUsecase: useCase)
    }
    
}
