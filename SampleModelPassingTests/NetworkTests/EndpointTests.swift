//
//  EndpointTests.swift
//  SampleModelPassingTests
//
//  Created by Can Kincal on 25.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import XCTest
@testable import SampleModelPassing
class EndpointTests: XCTestCase {
    func testEndpointBaseUrl() {
        XCTAssertEqual(ProductEndpoint.fetchProducts.baseUrl, "http://5e209e06e31c6e0014c60962.mockapi.io/api/products/")
        XCTAssertEqual(ProductEndpoint.fetchProductDetail(productId: "123").baseUrl, "http://5e209e06e31c6e0014c60962.mockapi.io/api/products/")
    }
    
    func testEndpointPaths() {
        XCTAssertEqual(ProductEndpoint.fetchProducts.path, "")
        XCTAssertEqual(ProductEndpoint.fetchProductDetail(productId: "123").path, "123")
    }
    
    func testEndpointFullPath() {
        let myPath = ProductEndpoint.fetchProducts.baseUrl + ProductEndpoint.fetchProducts.path
        let myUrlPath = URL(string: myPath)
        XCTAssertEqual(ProductEndpoint.fetchProducts.getUrl, myUrlPath)
    }
    
    
}
