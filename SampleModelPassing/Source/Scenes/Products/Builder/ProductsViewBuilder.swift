//
//  ProductsViewBuilder.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 25.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import UIKit

final class ProductsViewBuilder {
    class func make() -> UINavigationController {
        let controller = ProductsViewController()
        let presenter =  ProductsPresenter(view: controller)
        
        controller.presenter = presenter
        
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.setNavigationBarHidden(true, animated: false)
        
        return navigationController
    }
}
