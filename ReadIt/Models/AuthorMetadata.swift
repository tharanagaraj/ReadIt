//
//  Author.swift
//  ReadIt
//
//  Created by Thara Nagaraj on 6/17/19.
//  Copyright © 2019 Thara Nagaraj. All rights reserved.
//

import Foundation
import XMLMapper

struct AuthorMetadata: XMLMappable{
    init?(map: XMLMap) {}
    
    var nodeName: String!
    
    var id : Int32!
    var name : String!
    var link: Foundation.URL!
    
    mutating func mapping(map: XMLMap) {
        link <- (map["author.link"], XMLURLTransform())
        id <- map["author._id"]
        name <- map["author.name"]
    }
    
    init(id: Int32, name: String, link: URL) {
        self.id = id
        self.name = name
        self.link = link
    }
}
