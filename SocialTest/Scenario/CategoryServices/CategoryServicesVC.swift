//
//  CategoryServicesVC.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/29/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import UIKit

class CategoryServicesVC: BaseVC {
    
    lazy var logic = CategoryServicesVM(delegate: self)
    var pageTitle = String()
    
    @IBOutlet weak var clcContent: BaseCollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    enum sectionsType: Int, CaseIterable {
        case header = 0
        case services = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        logic.requestGetCategoryServices()
    }
    
    func setupViews() {
        lblTitle.text = pageTitle
        
        clcContent.register(UINib(nibName: "CategoryTitleClcCell", bundle: Bundle.main),forCellWithReuseIdentifier: "CategoryTitleClcCellID")
        clcContent.register(UINib(nibName: "CategoryServiceClcCell", bundle: Bundle.main),forCellWithReuseIdentifier: "CategoryServiceClcCellID")
        clcContent.delegate = self
        clcContent.dataSource = self
    }
    
    @IBAction func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension CategoryServicesVC: CategoryServicesDelegate {
    func requestGetCategoryServicesSucceeded() {
        clcContent.reloadData(animated: true)
    }
}

extension CategoryServicesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return logic.categoryServicesResponse == nil ? 0 : sectionsType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case sectionsType.header.rawValue:
            return 1
        case sectionsType.services.rawValue:
            return logic.categoryServicesResponse!.data.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case sectionsType.header.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryTitleClcCellID", for: indexPath) as! CategoryTitleClcCell
            cell.configure(logo: logic.categoryServicesResponse!.image.originalUrlAt4x ?? String(),
                           title: logic.categoryServicesResponse!.slogan,
                           subtitle: logic.categoryServicesResponse!.description,
                           clcView: collectionView)
            return cell
        case sectionsType.services.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryServiceClcCellID", for: indexPath) as! CategoryServiceClcCell
            cell.configure(service: logic.categoryServicesResponse!.data[indexPath.item],
                           clcView: collectionView)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
