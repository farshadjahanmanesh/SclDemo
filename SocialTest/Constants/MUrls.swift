//
//  MUrls.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/29/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Foundation

struct MUrls {
    static private var baseUrl = "https://api-dot-rafiji-staging.appspot.com/customer/"
    static private var versionUrl = "v2/"
    
    static var home: String {
        return baseUrl + versionUrl + "home"
    }
    
    static func categoryServices(category: String) -> String {
        return baseUrl + versionUrl + "categories/" + category + "/services"
    }
}
