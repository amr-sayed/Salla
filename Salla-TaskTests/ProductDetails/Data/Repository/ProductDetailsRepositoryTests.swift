//
//  ProductDetailsRepositoryTests.swift
//  Salla-TaskTests
//
//  Created by Amr Ahmed on 06/09/2024.
//

import XCTest
@testable import Salla_Task


final class ProductDetailsRepositoryTests: XCTestCase {

    private var validService: MockValidProductDetailsService!
    private var failureService: MockFailureProductDetailsService!
    private var expectationDesc: String!

    override func setUp() {
        super.setUp()
        validService = MockValidProductDetailsService()
        failureService = MockFailureProductDetailsService()
        expectationDesc = "validateProductDetails"
    }

    override func tearDown() {
        validService = nil
        failureService = nil
        expectationDesc = nil
        super.tearDown()
    }

    func testSUT_whenInitCalled_defaultParametersAreSet() {
        // When
        let sut = ProductDetailsRepository()

        // Then
        XCTAssertNotNil(sut.service)
    }

    func testSUT_whenInitCalled_customParametersAreSet() {
        // When
        let sut = makeSut(using: validService)

        // Then
        XCTAssertNotNil(sut.service)
    }

    func testSUT_whenApiRetunedValidData_productListNotEmpty() {
        // Given
        let exp = expectation(description: expectationDesc)

        let sut = makeSut(using: validService)

        // When
        let cancellable = sut
            .loadProductDetails(productId: MockData.productId)
            .receive(on: RunLoop.main)
            .sink { completion in
                guard case .failure(let error) = completion else { return }
                XCTFail("Expected to recieve value while validating accountNumber instead of \(error)")
            } receiveValue: { response in
                XCTAssertTrue(response.data.id != nil)
                exp.fulfill()
            }

        // Then
        waitForExpectations(timeout: 1.0)
        XCTAssertNotNil(cancellable)
    }

    func testSUT_whenApiRetunedInValidData_baseErrorRecieved() {
        // Given
        let exp = expectation(description: expectationDesc)

        let sut = makeSut(using: failureService)

        // When
        let cancellable = sut
            .loadProductDetails(productId: MockData.productId)
            .sink { completion in
                guard case .failure(let error) = completion else { return }
                XCTAssertEqual(error, MockData.internalServerError)
                exp.fulfill()
            } receiveValue: { response in
                XCTFail("Expected to fail while validating accountNumber instead of recieving \(response)")
            }

        // Then
        waitForExpectations(timeout: 1.0)
        XCTAssertNotNil(cancellable)
    }

    private func makeSut(using service: ProductDetailsServiceContract) -> ProductDetailsRepository {
        ProductDetailsRepository(service: service)
    }


}
