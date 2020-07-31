//
//  HomeVC.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/29/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import UIKit

class HomeVC: BaseVC {
    
    lazy var logic = HomeVM(delegate: self)
    
    @IBOutlet weak var vwHeadMain: UIView!
    @IBOutlet weak var tblContent: BaseTableView!
    enum sectionsType: Int, CaseIterable {
        case header = 0
        case categories = 1
        case promotions = 2
    }
    
    @IBOutlet weak var vwMainTabBar: UIView!
    @IBOutlet weak var stcTabBar: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        logic.requestGetHome()
    }
    
    func setupViews() {
        vwHeadMain.dropShadow(opacity: 0.1, radius: 10)
        vwHeadMain.layer.cornerRadius = 24
        vwHeadMain.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        tblContent.register(UINib(nibName: "HomeTitleTblCell", bundle: Bundle.main),forCellReuseIdentifier: "HomeTitleTblCellID")
        tblContent.register(UINib(nibName: "HomeCategoriesTblCell", bundle: Bundle.main),forCellReuseIdentifier: "HomeCategoriesTblCellID")
        tblContent.register(UINib(nibName: "HomePromotionsTblCell", bundle: Bundle.main),forCellReuseIdentifier: "HomePromotionsTblCellID")
        tblContent.delegate = self
        tblContent.dataSource = self
        
        setupTabView()
    }
    
    func setupTabView() {
        let tabs = [(#imageLiteral(resourceName: "tabHome"),"Home"),(#imageLiteral(resourceName: "tabMore"),String()),(#imageLiteral(resourceName: "tabProfile"),String()),(#imageLiteral(resourceName: "tabQuestion"),String())]
        for item in tabs {
            let tabView = Bundle.main.loadNibNamed("TabItemView", owner: nil, options: [:])![0] as! TabItemView
            tabView.configure(logo: item.0, title: item.1)
            stcTabBar.addArrangedSubview(tabView)
        }
        
        vwMainTabBar.dropShadow(opacity: 0.1, radius: 10)
        vwMainTabBar.layer.cornerRadius = 24
        vwMainTabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}

extension HomeVC: HomeDelegate {
    func requestGetHomeSucceeded() {
        tblContent.reloadData(animated: true)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return logic.homeResponse == nil ? 0 : sectionsType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case sectionsType.header.rawValue:
            return 1
        case sectionsType.categories.rawValue:
            return 1
        case sectionsType.promotions.rawValue:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case sectionsType.header.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTitleTblCellID", for: indexPath) as! HomeTitleTblCell
            cell.configure(title: logic.homeResponse!.title, subtitle: logic.homeResponse!.subTitle)
            return cell
        case sectionsType.categories.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCategoriesTblCellID", for: indexPath) as! HomeCategoriesTblCell
            cell.configure(categories: logic.homeResponse!.categories, delegate: self)
            return cell
        case sectionsType.promotions.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomePromotionsTblCellID", for: indexPath) as! HomePromotionsTblCell
            cell.configure(promotions: logic.homeResponse!.promotions)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension HomeVC: HomeCategoriesTblCellDelegate {
    func homeCategoryItemDidSelect(indexPath: IndexPath) {
        let category = logic.homeResponse!.categories[indexPath.item]
        let categoryServicesVC = MStoryboards.Main.categoryServicesVC(categorySlug: category.slug,
                                                                      pageTitle: category.title)
        navigationController?.pushViewController(categoryServicesVC, animated: true)
    }
}
