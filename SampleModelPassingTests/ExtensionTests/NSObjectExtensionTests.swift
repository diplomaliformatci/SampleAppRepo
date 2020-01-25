//
//  NSObjectExtensionTests.swift
//  SampleModelPassingTests
//
//  Created by Can Kincal on 25.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import XCTest
@testable import SampleModelPassing

class NSObjectExtensionTests: XCTestCase {

    class InnerMockClass: NSObject { }
    
    class InnerMockClassHasNoConformance { }
    
    func testDefaultBundle() {
        let defaultBundle = Bundle(for: type(of: self))
        XCTAssertEqual(defaultBundle, InnerMockClass.defaultBundle)
    }
    
    func testDefaultIdentifier() {
        let defaultIdentifier = "InnerMockClass"
        XCTAssertEqual(defaultIdentifier, InnerMockClass.defaultIdentifier)
    }

}
