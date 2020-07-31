//
//  JPromotion.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/29/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Arrow
struct JPromotion: ArrowParsable {
    
    var image = JImage()
    
    mutating func deserialize(_ json: JSON) {
        image <-- json["image"]
    }
}
