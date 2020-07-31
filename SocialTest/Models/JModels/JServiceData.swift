//
//  JServiceData.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/29/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Arrow
struct JServiceData: ArrowParsable {
    
    var titles              = JText()
    var subTitles           = JText()
    var shortDescriptions   = JText()
    var isActive            = Bool()
    var sort                = Int()
    var isSpecial           = Bool()
    var _id                 = String()
    var slug                = String()
    var coverImageId        = String()
    var categoryId          = String()
    var basePrice           = Int()
    var listBasePrice       = Int()
    var coverImage          = JCoverImage()
    var image               = JImage()
    var title               = String()
    var subTitle            = String()
    var shortDescription    = String()
    var hasDiscount         = Bool()
    var discountPercentage  = Int()
    var id                  = String()
    
    mutating func deserialize(_ json: JSON) {
        titles              <-- json["titles"]
        subTitles           <-- json["subTitles"]
        shortDescriptions   <-- json["shortDescriptions"]
        isActive            <-- json["isActive"]
        sort                <-- json["sort"]
        isSpecial           <-- json["isSpecial"]
        _id                 <-- json["_id"]
        slug                <-- json["slug"]
        coverImageId        <-- json["coverImageId"]
        categoryId          <-- json["categoryId"]
        basePrice           <-- json["basePrice"]
        listBasePrice       <-- json["listBasePrice"]
        coverImage          <-- json["coverImage"]
        image               <-- json["image"]
        title               <-- json["title"]
        subTitle            <-- json["subTitle"]
        shortDescription    <-- json["shortDescription"]
        hasDiscount         <-- json["hasDiscount"]
        discountPercentage  <-- json["discountPercentage"]
        id                  <-- json["id"]
    }
}
