//
//  ProductDetailViewController.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 25.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    struct Constants {
        static let navigationTitle = "Ürün Detayı"
    }
    
    // MARK: - Outlets
    @IBOutlet private weak var productNameLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    // MARK: - Properties
    var presenter: ProductDetailPresenterDelegate?
    
    // MARK: - Common Init
    init() {
        super.init(nibName: Self.defaultIdentifier, bundle: Self.defaultBundle)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


// MARK: - View Cycle
extension ProductDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchProductDetail()
        self.title = Constants.navigationTitle
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

// MARK: - ProductDetail Presenter to View Delegate
extension ProductDetailViewController: ProductDetailViewDelegate {
    func showProductDetail(product: ProductModel) {
        categoryLabel.text = product.category
        productNameLabel.text = product.name
        priceLabel.attributedText = product.price.convertToPrice(currency: .turkishLiras, fontSize: 16)
        imageView.image(url: product.image.asUrl, placeHolder: UIImage())
    }
}
