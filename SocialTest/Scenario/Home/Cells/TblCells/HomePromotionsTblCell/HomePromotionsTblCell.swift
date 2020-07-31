//
//  HomePromotionsTblCell.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/31/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import UIKit

class HomePromotionsTblCell: UITableViewCell {
    
    @IBOutlet weak var clcPromotions: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clcPromotions.register(UINib(nibName: "HomePromotionClcCell", bundle: Bundle.main),
                               forCellWithReuseIdentifier: "HomePromotionClcCellID")
        clcPromotions.delegate = self
        clcPromotions.dataSource = self
        clcPromotions.contentInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
    }
    
    var promotions = [JPromotion]()
    func configure(promotions: [JPromotion]){
        self.promotions = promotions
        clcPromotions.reloadData()
    }
}


extension HomePromotionsTblCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promotions.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePromotionClcCellID", for: indexPath) as! HomePromotionClcCell
        cell.configure(promotion: promotions[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 354, height: 164)
    }
}
