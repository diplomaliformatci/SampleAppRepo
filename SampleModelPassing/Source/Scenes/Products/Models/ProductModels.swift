//
//  ProductModels.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 25.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import Foundation

struct ProductModel {
    let id: String
    let category: String
    let name: String
    let price: String
    let image: String
    
    init(product: Product) {
        self.id = product.id
        self.category = product.category
        self.name = product.name
        self.price = product.price
        self.image = product.image
    }
    
}
