//
//  UIImageViewExtensions.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/31/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func load(url: String,
              placeholder: UIImage = UIImage(),
              callback: ((UIImage?) -> Void)? = nil,
              options: KingfisherOptionsInfo? = nil) {
        
        kf.setImage(with: URL(string: url),
                    placeholder: placeholder,
                    options: options) { (image, error, type, url) in
                        if error == nil && image != nil {
                            DispatchQueue.main.async {
                                self.image = image
                                callback?(image)
                            }
                        }
        }
    }
}
