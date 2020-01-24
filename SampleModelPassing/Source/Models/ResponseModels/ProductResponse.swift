//
//  ProductResponse.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 25.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import Foundation


struct Product: Decodable {
    let id: String
    let category: String
    let name: String
    let price: String
    let iamge: String
}
