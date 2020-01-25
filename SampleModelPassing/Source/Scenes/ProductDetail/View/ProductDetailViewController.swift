//
//  ProductDetailViewController.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 25.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var productNameLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    
    var presenter: ProductDetailPresenterDelegate?
    
    init() {
        super.init(nibName: Self.defaultIdentifier, bundle: Self.defaultBundle)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchProductDetail()
        self.title = "Ürün Detayı"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension ProductDetailViewController: ProductDetailViewDelegate {
    func showProductDetail(product: ProductModel) {
        categoryLabel.text = product.category
        productNameLabel.text = product.name
        priceLabel.attributedText = product.price.convertToPrice(currency: "TL", fontSize: 16)
        imageView.image(url: product.image.asUrl, placeHolder: UIImage())
    }
}
