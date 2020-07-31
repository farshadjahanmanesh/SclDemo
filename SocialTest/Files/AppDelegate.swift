//
//  AppDelegate.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/26/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import UIKit
import Arrow

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //set arrow dateFormatter to direct cast String to Date
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        Arrow.setDateFormatter(dateFormatter)
        
        return true
    }
    
}

