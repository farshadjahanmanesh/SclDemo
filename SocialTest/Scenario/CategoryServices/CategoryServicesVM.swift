//
//  CategoryServicesVM.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/29/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Foundation

protocol CategoryServicesDelegate: BaseVM {
    func requestGetCategoryServicesSucceeded()
}

class CategoryServicesVM {
    
    weak var delegate: CategoryServicesDelegate? = nil
    init(delegate: CategoryServicesDelegate) {
        self.delegate = delegate
    }
    //MARK:- category slug
    var categorySlug: String!
    
    //MARK:- category data request
    var categoryServicesResponse: JResCategoryServices? = nil
    func requestGetCategoryServices(){
        WebServices.categoryServices(category: categorySlug,
                                     success: { [weak self](response) in
            let result = response.result as! JResCategoryServices
            self?.categoryServicesResponse = result
            self?.delegate?.requestGetCategoryServicesSucceeded()
        }) { (response) in
            print("request failed - response:\(response)")
        }
    }
    
}
