//
//  UIViewExtensions.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/30/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import UIKit

extension UIView {
    func dropShadow(color: UIColor = .black,
                    opacity: Float = 0.25,
                    offset: CGSize = .zero,
                    radius: CGFloat = 5){
        
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
    }
}
