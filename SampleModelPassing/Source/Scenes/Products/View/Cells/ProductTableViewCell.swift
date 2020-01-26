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
    @IBOutlet private weak var purchaseButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        purchaseButton.layer.roundToMinimumEdge()
    }
    
    func configureCell(product: ProductModel) {
        categoryLabel.text = product.category
        productNameLabel.text = product.name
        priceLabel.attributedText = product.price.convertToPrice(currency: .turkishLiras, fontSize: 11)
        thumbImageView.image(url: product.image.asUrl, placeHolder: UIImage())
    }
        
    @IBAction func purchaseNowButtonTapped(_ sender: Any) {
        print("Button Pressed")
    }
    
}
