//
//  ProductsViewContracts.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 26.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import Foundation

protocol ProductsPresenterDelegate: class {
    func product(with indexPath: IndexPath, result: (_ product: ProductModel) -> ())
    func getProducts()
}

protocol ProductsViewDelegate: class {
    func showProducts(products: [ProductModel])
    func showError(error: String)
}
