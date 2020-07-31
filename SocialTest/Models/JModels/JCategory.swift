//
//  JCategory.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/29/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Arrow
struct JCategory: ArrowParsable {
    
    var titles              = JText()
    var subTitles           = JText()
    var descriptions        = JText()
    var shortDescriptions   = JText()
    var isActive            = Bool()
    var sort                = Int()
    var hasNewBadge         = Bool()
    var displayType         = String()
    var _id                 = String()
    var slug                = String()
    var title               = String()
    var subTitle            = String()
    var description         = String()
    var shortDescription    = String()
    var image               = JImage()
    var id                  = String()
    
    mutating func deserialize(_ json: JSON) {
        titles              <-- json["titles"]
        subTitles           <-- json["subTitles"]
        descriptions        <-- json["descriptions"]
        shortDescriptions   <-- json["shortDescriptions"]
        isActive            <-- json["isActive"]
        sort                <-- json["sort"]
        hasNewBadge         <-- json["hasNewBadge"]
        displayType         <-- json["displayType"]
        _id                 <-- json["_id"]
        slug                <-- json["slug"]
        title               <-- json["title"]
        subTitle            <-- json["subTitle"]
        description         <-- json["description"]
        shortDescription    <-- json["shortDescription"]
        image               <-- json["image"]
        id                  <-- json["id"]
    }
}
