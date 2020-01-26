//
//  UIViewController++.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 26.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import UIKit.UIViewController
extension UIViewController {
    func showDefaultAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
