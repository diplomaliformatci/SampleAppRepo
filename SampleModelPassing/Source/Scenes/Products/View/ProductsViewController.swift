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
    
    init() {
        super.init(nibName: Self.defaultIdentifier, bundle: Self.defaultBundle)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("Init coder Implements ")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
