//
//  MStoryboards.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/29/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//
import UIKit

class MStoryboards {
    
    class Main {
        static var board: UIStoryboard {
            return UIStoryboard(name: "Main", bundle: Bundle.main)
        }
        
        
        static var homeVC: HomeVC {
            let vc = board.instantiateViewController(withIdentifier: "Home") as! HomeVC
            vc.modalPresentationStyle = .fullScreen
            return vc
        }
        
        static func categoryServicesVC(categorySlug: String, pageTitle: String) -> CategoryServicesVC {
            let vc = board.instantiateViewController(withIdentifier: "CategoryServices") as! CategoryServicesVC
            vc.modalPresentationStyle = .fullScreen
            
            vc.pageTitle = pageTitle
            vc.logic.categorySlug = categorySlug
            
            return vc
        }
    }
}
