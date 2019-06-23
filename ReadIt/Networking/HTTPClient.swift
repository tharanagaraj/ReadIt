//
//  HTTPClient.swift
//  ReadIt
//
//  Created by Thara Nagaraj on 6/9/19.
//  Copyright © 2019 Thara Nagaraj. All rights reserved.
//

import Foundation
import Alamofire
import Keys
import SWXMLHash

class HTTPClient: NSObject {
    
    static let keys = ReadItKeys()
    typealias RequestParams = [String: String]
    
    public static func request (url urlString : URL, param : RequestParams? = nil, completion: @escaping (String) -> Void){
        var parameters = ["key" : keys.goodreadsAPIClientKey]
        if param != nil {
            parameters = param?.merging(parameters, uniquingKeysWith: {(old, new) in new}) ?? ["":""]
        }
        
        AF.request(urlString, method: .get, parameters: parameters)
        .validate(statusCode: 200..<600)
        .responseString{ response in
            switch response.result{
            case .success(let stringValue):
                 completion(stringValue)
                break
            case .failure(let error):
                print(error)
            }
        }
        
    }
}






