//
//  CALayerExtensionTests.swift
//  SampleModelPassingTests
//
//  Created by Can Kincal on 26.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import XCTest
@testable import SampleModelPassing
class CALayerExtensionTests: XCTestCase {
    
    func testRoundToMinimumEdge() {
        let layer = CALayer()
        
        /// Wider
        layer.bounds.size = sizeFor(50, 20)
        let radius = layer.roundToMinimumEdge()
        XCTAssertEqual(radius, layer.cornerRadius)
        XCTAssertEqual(radius, 10)
        
        /// Taller
        layer.bounds.size = sizeFor(20, 50)
        layer.roundToMinimumEdge()
        XCTAssertEqual(layer.cornerRadius, 10)
        
        /// Square Input
        layer.bounds.size = sizeFor(50, 50)
        layer.roundToMinimumEdge()
        XCTAssertEqual(layer.cornerRadius, 25)
        
        /// Negative Input
        layer.bounds.size = sizeFor(-50, 50)
        layer.roundToMinimumEdge()
        XCTAssertEqual(layer.cornerRadius, 25)
    }
    private func sizeFor(_ width: CGFloat, _ height: CGFloat) -> CGSize {
        return CGSize(width: width, height: height)
    }
    
}
