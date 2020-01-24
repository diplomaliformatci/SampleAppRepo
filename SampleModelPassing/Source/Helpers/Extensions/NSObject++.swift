//
//  NSObject++.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 24.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import Foundation

extension NSObject {
    static var defaultIdentifier: String {
        return String(describing: Self.self)
    }
    
    static var defaultBundle: Bundle {
        return Bundle(for: self)
    }
}

