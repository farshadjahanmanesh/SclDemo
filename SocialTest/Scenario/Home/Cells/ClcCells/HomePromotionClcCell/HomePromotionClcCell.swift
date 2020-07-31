//
//  HomePromotionClcCell.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/31/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import UIKit

class HomePromotionClcCell: UICollectionViewCell {

    @IBOutlet weak var imgPromotion: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgPromotion.layer.cornerRadius = 16
    }
    
    func configure(promotion: JPromotion){
        imgPromotion.load(url: promotion.image.originalUrl ?? String())
    }

}
