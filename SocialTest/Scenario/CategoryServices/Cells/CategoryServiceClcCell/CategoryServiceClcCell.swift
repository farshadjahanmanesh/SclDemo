//
//  CategoryServiceClcCell.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/31/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import UIKit

class CategoryServiceClcCell: UICollectionViewCell {

    
    @IBOutlet weak var cnsWidth: NSLayoutConstraint!
    @IBOutlet weak var vwMain: UIView!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblDiscountPercent: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblPriceDiscounted: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vwMain.layer.cornerRadius = 16
        lblDiscountPercent.layer.cornerRadius = lblDiscountPercent.frame.height/2
    }
    
    func configure(service: JServiceData, clcView: UICollectionView) {
        cnsWidth.constant = (clcView.frame.width/2) - 1
        
        imgLogo.load(url: service.image.originalUrlAt4x ?? String())
        lblTitle.text = service.title
        lblSubtitle.text = service.subTitle
        lblDescription.text = service.shortDescription
        lblPrice.text = Double(service.basePrice).money(discountPercent: service.discountPercentage)
        
        if service.discountPercentage == 0 {
            lblPriceDiscounted.isHidden = true
            lblDiscountPercent.isHidden = true
        } else {
            lblPriceDiscounted.isHidden = false
            lblDiscountPercent.isHidden = false
            
            lblDiscountPercent.text = "%\(service.discountPercentage)"
            lblPriceDiscounted.attributedText = Double(service.basePrice).discountedMoney()
        }
        
        if service.isSpecial {
            vwMain.backgroundColor = UIColor(named: "ccPrimary")
            lblTitle.textColor = UIColor(named: "ccWhite")
            lblSubtitle.textColor = UIColor(named: "ccWhite")
            lblDescription.textColor = UIColor(named: "ccWhite")
        } else {
            vwMain.backgroundColor = UIColor(named: "ccCardBackground")
            lblTitle.textColor = UIColor(named: "ccGrayDark")
            lblSubtitle.textColor = UIColor(named: "ccGrayDark")
            lblDescription.textColor = UIColor(named: "ccGray")
        }
    }

}
