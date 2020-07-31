//
//  JCoverImage.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/29/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Arrow
struct JCoverImage: ArrowParsable {
    
    var _id             = String()
    var path            = String()
    var fileName        = String()
    var type            = String()
    var thumbnails      = JThumbnails()
    var createdAt       = Date()
    var updatedAt       = Date()
    var displayType     = String()
    var __v             = Int()
    var serviceId       = String()
    var originalUrl     = String()
    var id              = String()
    
    mutating func deserialize(_ json: JSON) {
        _id             <-- json["_id"]
        path            <-- json["path"]
        fileName        <-- json["fileName"]
        type            <-- json["type"]
        thumbnails      <-- json["thumbnails"]
        createdAt       <-- json["createdAt"]
        updatedAt       <-- json["updatedAt"]
        displayType     <-- json["displayType"]
        __v             <-- json["__v"]
        serviceId       <-- json["serviceId"]
        originalUrl     <-- json["originalUrl"]
        id              <-- json["id"]
    }
}
