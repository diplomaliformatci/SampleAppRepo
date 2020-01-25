//
//  ProductsPresenter.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 25.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import Foundation

protocol ProductsPresenterDelegate: class {
    func product(with indexPath: IndexPath, result: (_ product: ProductModel) -> ())
    func getProducts()
}

protocol ProductsViewDelegate: class {
    func showProducts(products: [ProductModel])
    func showError()
}

final class ProductsPresenter {
    unowned var view: ProductsViewDelegate!
    var products: [ProductModel]? {
        didSet {
            showProducts()
        }
    }
    
    init(view: ProductsViewDelegate) {
        self.view = view
    }
    
    private func showProducts() {
        guard let products = self.products else { return }
        view.showProducts(products: products)
    }
}

extension ProductsPresenter: ProductsPresenterDelegate {
    func product(with indexPath: IndexPath, result: (ProductModel) -> ()) {
        guard let product = products?[indexPath.row] else { return }
        result(product)
    }
    
    func getProducts() {
        NetworkFetch<[Product]>().fetchData(from: ProductEndpoint.fetchProducts) { [weak self] (products, statusCode, error) in
            guard let self = self else { return }
            switch statusCode {
            case 200:
                self.products = products.compactMap{ ProductModel(product: $0) }
            default:
                self.view.showError()
            }
        }
    }
}
