//
//  JImage.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/29/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Arrow
struct JImage: ArrowParsable {
    
    var originalUrl:        String? = nil
    var originalUrlAt2x:    String? = nil
    var originalUrlAt3x:    String? = nil
    var originalUrlAt4x:    String? = nil
    var originalUrlPDF:     String? = nil
    var originalUrlSVG:     String? = nil
    
    mutating func deserialize(_ json: JSON) {
        originalUrl         <-- json["originalUrl"]
        originalUrlAt2x     <-- json["originalUrl@2x"]
        originalUrlAt3x     <-- json["originalUrl@3x"]
        originalUrlAt4x     <-- json["originalUrl@4x"]
        originalUrlPDF      <-- json["originalUrlPDF"]
        originalUrlSVG      <-- json["originalUrlSVG"]
    }
}
