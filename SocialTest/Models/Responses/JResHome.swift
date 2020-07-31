//
//  JResHome.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/29/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Arrow
struct JResHome: ArrowParsable {
    
    var title       = String()
    var subTitle    = String()
    var categories  = [JCategory]()
    var promotions  = [JPromotion]()
    
    mutating func deserialize(_ json: JSON) {
        title       <-- json["title"]
        subTitle    <-- json["subTitle"]
        categories  <-- json["categories"]
        promotions  <-- json["promotions"]
    }
}
