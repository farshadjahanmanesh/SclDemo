//
//  HomeCategoriesTblCell.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/31/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import UIKit

class HomeCategoriesTblCell: UITableViewCell {
    
    weak var delegate: HomeCategoriesTblCellDelegate? = nil
    @IBOutlet weak var clcCategories: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clcCategories.register(UINib(nibName: "HomeCategoryClcCell", bundle: Bundle.main),
                               forCellWithReuseIdentifier: "HomeCategoryClcCellID")
        clcCategories.delegate = self
        clcCategories.dataSource = self
        clcCategories.contentInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
    }
    
    var categories = [JCategory]()
    func configure(categories: [JCategory], delegate: HomeCategoriesTblCellDelegate? = nil){
        self.delegate = delegate
        self.categories = categories
        clcCategories.reloadData()
    }
}

extension HomeCategoriesTblCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryClcCellID", for: indexPath) as! HomeCategoryClcCell
        cell.configure(category: categories[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 195, height: 214)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.homeCategoryItemDidSelect(indexPath: indexPath)
    }
}

protocol HomeCategoriesTblCellDelegate: class {
    func homeCategoryItemDidSelect(indexPath: IndexPath)
}
