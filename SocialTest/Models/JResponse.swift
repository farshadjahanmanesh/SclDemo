//
//  JResponse.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/26/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Arrow

struct JResponse: ArrowParsable {
    
    var result: ArrowParsable? = nil

    init() {
        
    }

    init(_ resultType: ArrowParsable.Type?) {
        self.result = resultType?.init()
    }

    mutating func deserialize(_ json: JSON) {
        result?.deserialize(json)
    }

    mutating func parse(_ dictionary: Any?) {
        if let json = JSON(dictionary as? NSDictionary) {
            deserialize(json)
        }
    }
}

