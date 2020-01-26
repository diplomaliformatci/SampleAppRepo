//
//  ResponseDecodingTests.swift
//  SampleModelPassingTests
//
//  Created by Can Kincal on 25.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import XCTest
@testable import SampleModelPassing

class ResponseDecodingTests: XCTestCase {
    
    func testNetworkParseFetched() {
        let network = NetworkFetch<[Product]>()
        let jsonData = toJsonString(path: getPath(path: "Products", contentType: "json")).data(using: .utf8)
        XCTAssertNotNil(jsonData)
        
        let data = network.parseData(data: jsonData!)
        XCTAssertNotNil(data)
    }
    
    func testProducDecoder() {
        let jsonData = toJsonString(path: getPath(path: "Products", contentType: "json")).data(using: .utf8)
        XCTAssertNotNil(jsonData)
        do {
            let _ = try JSONDecoder().decode([Product].self, from: jsonData!)
        } catch {
            XCTFail("Cannot parse json from product json model")
        }
    }
    
    
    private func getPath(path: String, contentType: String) -> String {
        let path = Bundle(for: type(of: self)).path(forResource: path, ofType: contentType)
        assert(path != nil, "Json model Parse returns nil paramter \(#function)")
        return path!
    }
    
    private func toJsonString(path: String, encoding: String.Encoding = .utf8) -> String {
        var str = ""
        do {
            str = try String(contentsOfFile: path, encoding: encoding)
        } catch {
            XCTFail("Cannot Convert Json to string")
        }
   
        return str
    }
}
