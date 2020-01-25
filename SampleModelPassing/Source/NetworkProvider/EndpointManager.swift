//
//  EndpointManager.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 25.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import Foundation

protocol EndpointType {
    var baseUrl: String { get }
    var path: String { get }
    var getUrl: URL? { get }
}

enum ProductEndpoint {
    case fetchProducts
    case fetchProductDetail(productId: String)
}

extension ProductEndpoint: EndpointType {
    var baseUrl: String {
        return "http://5e209e06e31c6e0014c60962.mockapi.io/api/products/"
    }
    
    var path: String {
        switch self {
        case .fetchProducts:
            return ""
        case .fetchProductDetail(let productId):
            return productId
        }
    }
    
    var getUrl: URL? {
        return URL(string: self.baseUrl + self.path)
    }
}
