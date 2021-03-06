//
//  ProductsTests.swift
//  SampleModelPassingTests
//
//  Created by Can Kincal on 26.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import XCTest
@testable import SampleModelPassing
class ProductsTests: XCTestCase {

    func testProductsBuilder() {
        let controller = ProductsViewBuilder.make()
        XCTAssertNotNil(controller)
        XCTAssertNotNil(controller.presenter)
    }
}
