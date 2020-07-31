//
//  CategoryTitleClcCell.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/31/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import UIKit

class CategoryTitleClcCell: UICollectionViewCell {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var cnsWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(logo: String,
                   title: String,
                   subtitle: String,
                   clcView: UICollectionView){
        imgLogo.load(url: logo)
        lblTitle.text = title
        lblSubtitle.text = subtitle
        
        cnsWidth.constant = clcView.frame.width
    }
}
