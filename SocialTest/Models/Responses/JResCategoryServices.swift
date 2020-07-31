//
//  JResCategoryServices.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/29/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Arrow
struct JResCategoryServices: ArrowParsable {
    
    var title           = String()
    var image           = JImage()
    var slogan          = String()
    var description     = String()
    var data            = [JServiceData]()
    
    mutating func deserialize(_ json: JSON) {
        title           <-- json["title"]
        image           <-- json["image"]
        slogan          <-- json["slogan"]
        description     <-- json["description"]
        data            <-- json["data"]
    }
}
