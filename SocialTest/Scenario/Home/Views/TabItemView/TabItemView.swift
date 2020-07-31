//
//  TabItemView.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/31/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import UIKit

class TabItemView: UIView {
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    func configure(logo: UIImage,
                   title: String = String()) {
        imgLogo.image = logo
        lblTitle.text = title
    }
}
