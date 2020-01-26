//
//  String++.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 25.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import UIKit.NSAttributedString

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}

extension String {
    enum CurrencyType: String {
        case turkishLiras = "TL"
    }
    
    func convertToPrice(currency: CurrencyType, fontSize: CGFloat) -> NSMutableAttributedString {
        let attributedStr = NSMutableAttributedString(string: self + " ")
        let currencyStr = NSMutableAttributedString(string: currency.rawValue,
                                                    attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize, weight: .bold)])
        attributedStr.append(currencyStr)
        return attributedStr
    }
}
