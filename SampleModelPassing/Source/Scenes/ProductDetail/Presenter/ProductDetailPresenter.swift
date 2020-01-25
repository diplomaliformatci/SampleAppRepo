//
//  ProductDetailPresenter.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 25.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import Foundation

protocol ProductDetailPresenterDelegate: class {
    func fetchProductDetail()
}

protocol ProductDetailViewDelegate: class {
    func showProductDetail(product: ProductModel)
}

final class ProductDetailPresenter {
    unowned var view: ProductDetailViewDelegate?
    var product: ProductModel
    
    init(product: ProductModel, view: ProductDetailViewDelegate?) {
        self.view = view
        self.product = product
    }
    
    func showProduct(product: ProductModel) {
        DispatchQueue.main.async {
            self.view?.showProductDetail(product: product)
        }
    }

}

extension ProductDetailPresenter: ProductDetailPresenterDelegate {
    func fetchProductDetail() {
        showProduct(product: product)
        NetworkFetch<Product>().fetchData(from: ProductEndpoint.fetchProductDetail(productId: product.id)) { [weak self] (product, statusCode, error) in
            switch statusCode {
            case 200:
                self?.showProduct(product: ProductModel(product: product))
            default:
                break
            }
        }
    }
}
