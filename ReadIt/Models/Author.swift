//
//  Author.swift
//  ReadIt
//
//  Created by Thara Nagaraj on 6/17/19.
//  Copyright © 2019 Thara Nagaraj. All rights reserved.
//

import Foundation
import XMLMapper


//<?xml version="1.0" encoding="UTF-8"?>
//<GoodreadsResponse>
//<Request>
//<authentication>true</authentication>
//<key><![CDATA[X8UiFzjoi8UyiZvP53yWHw]]></key>
//<method><![CDATA[api_author_link]]></method>
//</Request>
//
//
//<author id="1406384">
//<name><![CDATA[John Green]]></name>
//<link>https://www.goodreads.com/author/show/1406384.John_Green?utm_medium=api&amp;utm_source=author_link</link>
//</author>
//</GoodreadsResponse>

//<GoodreadsResponse>
//<Request>
//<authentication>true</authentication>
//<key>X8UiFzjoi8UyiZvP53yWHw</key>
//<method>api_author_link</method>
//</Request>
//
//
//<author id="1406384">
//<name>John Green</name>
//<link>https://www.goodreads.com/author/show/1406384.John_Green?utm_medium=api&utm_source=author_link</link>
//</author>
//</GoodreadsResponse>

struct Author: XMLMappable{
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


class AuthorClass: XMLMappable {
    var nodeName: String!
    
    var id: Int!
    var name : String!
    var link : Foundation.URL!
    
//    var authorNode: AuthorNode!
    var test: String!
    
    required init?(map: XMLMap) {
    }


    func mapping(map: XMLMap) {
        id <- map["author"].attributes["id"]
        name <- map["name"]
        link <- (map["link"], XMLURLTransform())
        test <- map["test"]
    }
}
