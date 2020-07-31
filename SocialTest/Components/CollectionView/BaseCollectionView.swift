//
//  BaseCollectionView.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/31/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import UIKit

class BaseCollectionView: UICollectionView {
    func reloadData(animated: Bool) {
        if !animated {
            reloadData()
            return
        }
        UIView.transition(with: self,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in
                            self?.reloadData()
            }, completion: nil)
    }
}
