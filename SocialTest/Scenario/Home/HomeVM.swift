//
//  HomeVM.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/29/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Foundation

protocol HomeDelegate: BaseVM {
    func requestGetHomeSucceeded()
}

class HomeVM {
    
    weak var delegate: HomeDelegate? = nil
    init(delegate: HomeDelegate) {
        self.delegate = delegate
    }
    
    //MARK:- Home data request
    var homeResponse: JResHome? = nil
    func requestGetHome(){
        WebServices.home(success: { [weak self](response) in
            let result = response.result as! JResHome
            self?.homeResponse = result
            self?.delegate?.requestGetHomeSucceeded()
        }) { (response) in
            print("request failed - response:\(response)")
        }
    }
}
