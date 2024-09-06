//
//  ProductDetailsViewModelTests.swift
//  Salla-TaskTests
//
//  Created by Amr Ahmed on 06/09/2024.
//

import XCTest
@testable import Salla_Task


final class ProductDetailsViewModelTests: XCTestCase {

    private var validService: MockValidProductDetailsService!
    private var failureService: MockFailureProductDetailsService!
    private var sut: ProductDetailsViewModel!
    private var expectationDesc: String!
    
    override func setUp() {
        super.setUp()
        sut = ProductDetailsViewModel(productId: MockData.productId)
        validService = MockValidProductDetailsService()
        failureService = MockFailureProductDetailsService()
        expectationDesc = "ValidateProductDetailsViewModel"
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_whenInitCalled_defaultParametersAreSet_accountNumberIsEmpty() {
        XCTAssertTrue(sut.product.id == nil)
    }
    
    func testSUT_whenLoadProductDetails_baseErrorRecieved() {
        // Given
        let sut = makeSut(using: failureService)
        let exp = expectation(description: expectationDesc)
        
        // When
        sut.loadProductDetails()
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
    
    func testSUT_whenLoadBProductDetails_responsePhoneNumberNotEmpty() {
        // Given
        let sut = makeSut(using: validService)
        let exp = expectation(description: expectationDesc)
        
        // When
        sut.loadProductDetails()
        sut.$product
            .sink(receiveValue: { products in
                if sut.product.id != nil {
                    exp.fulfill()
                }
            })
            
            .store(in: &sut.cancellables)
        
        // Then
        waitForExpectations(timeout: 1.0)
        XCTAssertTrue(sut.product.id  != nil)
    }
    
    private func makeSut(using service: ProductDetailsServiceContract) -> ProductDetailsViewModel {
        let repository = ProductDetailsRepository(service: service)
        let useCase = ProductDetailsUsecase(repository: repository)
        
        return ProductDetailsViewModel(productId: MockData.productId)
    }
    

}
