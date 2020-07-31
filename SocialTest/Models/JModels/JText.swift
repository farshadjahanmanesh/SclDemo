//
//  JText.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/29/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Arrow
struct JText: ArrowParsable {
    
    var en: String? = nil
    var ar: String? = nil
    
    mutating func deserialize(_ json: JSON) {
        en  <-- json["en"]
        ar  <-- json["ar"]
    }
}
