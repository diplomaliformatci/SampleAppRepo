//
//  UITableViewCell++.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 26.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import UIKit.UITableViewCell

extension UITableViewCell {
    static var nib: UINib {
        return UINib(nibName: self.defaultIdentifier, bundle: self.defaultBundle)
    }
}
