//
//  PostModel.swift
//  JSONtoClass
//
//  Created by user139236 on 6/2/18.
//  Copyright © 2018 JCMA. All rights reserved.
//

import Foundation
import SwiftyJSON

struct PostModel {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}
extension PostModel {
    init?(jsonObject: JSON) {
        guard
            let userId = jsonObject["userId"].int,
            let id = jsonObject["id"].int,
            let title = jsonObject["title"].string,
            let body = jsonObject["body"].string
        else {
                return nil
        }
        
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}
