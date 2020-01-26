//
//  ProductDetailContracts.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 26.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import Foundation

protocol ProductDetailPresenterDelegate: class {
    func fetchProductDetail()
}

protocol ProductDetailViewDelegate: class {
    func showProductDetail(product: ProductModel)
}
