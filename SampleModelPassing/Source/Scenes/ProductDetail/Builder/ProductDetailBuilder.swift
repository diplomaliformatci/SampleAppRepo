//
//  ProductDetailBuilder.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 25.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import Foundation

final class ProductDetailBuilder {
    class func make(productModel: ProductModel) -> ProductDetailViewController {
        let controller = ProductDetailViewController()
        let presenter = ProductDetailPresenter(product: productModel, view: controller)
        
        controller.presenter = presenter
        
        return controller
    }
}
