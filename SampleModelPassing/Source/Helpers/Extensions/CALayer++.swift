//
//  CALayer++.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 26.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import QuartzCore

extension CALayer {
    @discardableResult
    func roundToMinimumEdge() -> CGFloat {
        let minimumEdge = min(bounds.height, bounds.width)
        cornerRadius = minimumEdge / 2
        return cornerRadius
    }
}
