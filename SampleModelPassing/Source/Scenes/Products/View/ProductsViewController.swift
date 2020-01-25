//
//  ProductsViewController.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 24.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: UITableViewDataSource?
    
    // MARK: - Properties
    var presenter: ProductsPresenterDelegate?
    
    init() {
        super.init(nibName: Self.defaultIdentifier, bundle: Self.defaultBundle)
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor.navigationBarColor
        backButtonItem.tintColor = UIColor.navigationBarBackButtonColor
        navigationItem.backBarButtonItem = backButtonItem
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func registerNibs() {
        tableView.register(ProductTableViewCell.nib, forCellReuseIdentifier: ProductTableViewCell.defaultIdentifier)
    }

}
// MARK: - View Cycle
extension ProductsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        tableView.delegate = self
        presenter?.getProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension ProductsViewController: ProductsViewDelegate {
    func showProducts(products: [ProductModel]) {
        let dataSource = GenericTableViewDataSource.init(dataArr: products, reuseIdentifier: ProductTableViewCell.defaultIdentifier) { (product, cell) in
            guard let cell = cell as? ProductTableViewCell else { return }
            cell.configureCell(product: product)
        }
        
        DispatchQueue.main.async {
            self.dataSource = dataSource
            self.tableView.dataSource = dataSource
            self.tableView.reloadData()
        }
    }
    
    func showError() {
        
    }
}

extension ProductsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("RowSelected")
        presenter?.product(with: indexPath, result: { [weak self] (product) in
            let controller = ProductDetailBuilder.make(productModel: product)
            self?.navigationController?.pushViewController(controller, animated: true)
        })
    }
}
