//
//  HomeCategoryClcCell.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/31/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import UIKit

class HomeCategoryClcCell: UICollectionViewCell {

    @IBOutlet weak var vwMain: UIView!
    
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblNew: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vwMain.layer.cornerRadius = 16
        vwMain.dropShadow(opacity: 0.05, radius: 5)
        lblNew.layer.cornerRadius = lblNew.frame.height/2
    }
    
    func configure(category: JCategory){
        imgLogo.load(url: category.image.originalUrlAt4x ?? String())
        lblNew.isHidden = !category.hasNewBadge
        lblTitle.text = category.title
        lblSubtitle.text = category.subTitle
        lblDescription.text = category.shortDescription
    }
}
