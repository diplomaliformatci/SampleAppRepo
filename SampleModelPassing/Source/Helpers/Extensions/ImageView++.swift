//
//  ImageView++.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 24.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import Kingfisher

internal extension UIImageView {
    private var defaultOptions: KingfisherOptionsInfo? {
        return [.cacheSerializer(DefaultCacheSerializer.default), .transition(.fade(0.4)), .forceRefresh]
    }
    
    func image(url: URL?, placeHolder: UIImage?) {
        self.kf.setImage(with: url, placeholder: placeHolder, options: defaultOptions)
    }
}
