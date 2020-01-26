//
//  GenericTableViewTests.swift
//  SampleModelPassingTests
//
//  Created by Can Kincal on 25.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import XCTest
@testable import SampleModelPassing

class GenericTableViewTests: XCTestCase {
    class MockType {}
    class MockCell: UITableViewCell {}
    func testGenericTableViewDataType() {
        let dataSource = GenericTableViewDataSource(
            dataArr: [MockType()],
            reuseIdentifier: "UITableViewCell") { (model, cell) in
                XCTAssertTrue(cell.isKind(of: MockCell.self))
        }
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.register(MockCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.reloadData()
        tableView.cellForRow(at: IndexPath(row: 0, section: 0))
    }
}
