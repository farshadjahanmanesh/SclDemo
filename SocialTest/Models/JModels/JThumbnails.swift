//
//  JThumbnails.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/29/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Arrow
struct JThumbnails: ArrowParsable {
    
    var has128x128  = Bool()
    var has256x256  = Bool()
    var has512x512  = Bool()
    
    mutating func deserialize(_ json: JSON) {
        has128x128  <-- json["has128x128"]
        has256x256  <-- json["has256x256"]
        has512x512  <-- json["has512x512"]
    }
}
