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
    
    // MARK: - Properties
    var presenter: ProductsPresenterDelegate?
    var dataSource: UITableViewDataSource?
    
    // MARK: - Common Init
    init() {
        super.init(nibName: Self.defaultIdentifier, bundle: Self.defaultBundle)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func registerNibs() {
        tableView.register(ProductTableViewCell.nib, forCellReuseIdentifier: ProductTableViewCell.defaultIdentifier)
    }
    
    // MARK: - Helpers
    private func configureLayout(_ animated: Bool) {
        navigationController?.setNavigationBarColor(to: .navigationBarColor)
        navigationItem.backBarButtonItem = generateBackButton()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func generateBackButton() -> UIBarButtonItem {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backButton.tintColor = .navigationBarBackButtonColor
        return backButton
    }
    
    private func reloadData(with dataSource: UITableViewDataSource? = nil) {
        guard
            let dataSource = dataSource else { tableView.reloadData(); return }
        
        self.dataSource = dataSource
        tableView.dataSource = dataSource
        tableView.reloadData()
        
    }
}

// MARK: - View Cycle
extension ProductsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        registerNibs()
        presenter?.getProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureLayout(animated)
    }
}

// MARK: - ProductsPresenter to View Delegate
extension ProductsViewController: ProductsViewDelegate {
    func showProducts(products: [ProductModel]) {
        let dataSource = GenericTableViewDataSource.init(dataArr: products, reuseIdentifier: ProductTableViewCell.defaultIdentifier) { (product, cell) in
            guard let cell = cell as? ProductTableViewCell else { return }
            cell.configureCell(product: product)
        }
     
        reloadData(with: dataSource)
    }
    
    func showError(error: String) {
        showDefaultAlert(title: "SampleModel", message: error)
    }
}

extension ProductsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.product(with: indexPath, result: { [weak self] (product) in
            let controller = ProductDetailBuilder.make(productModel: product)
            self?.navigationController?.pushViewController(controller, animated: true)
        })
    }
}
