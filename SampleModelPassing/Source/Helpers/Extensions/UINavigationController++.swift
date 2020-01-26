//
//  UINavigationController++.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 26.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import UIKit.UINavigationController

extension UINavigationController {
    func setNavigationBarColor(to color: UIColor) {
        navigationBar.tintColor = color
    }
    
    func setPlainBackButton(with color: UIColor) {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backButton.tintColor = color
        self.navigationItem.backBarButtonItem = backButton
    }
}
