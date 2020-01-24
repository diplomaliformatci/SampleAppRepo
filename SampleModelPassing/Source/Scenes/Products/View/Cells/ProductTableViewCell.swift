//
//  ProductTableViewCell.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 24.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var thumbImageView: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var productNameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func purchaseNowButtonTapped(_ sender: Any) {
        print("Button Pressed")
    }
    
}
