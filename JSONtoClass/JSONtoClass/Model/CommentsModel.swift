//
//  CommentsModel.swift
//  JSONtoClass
//
//  Created by user139236 on 6/2/18.
//  Copyright © 2018 JCMA. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CommentsModel {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
    
}
extension CommentsModel {
    init?(jsonObject: JSON) {
        guard
            let postId = jsonObject["postId"].int,
            let id = jsonObject["id"].int,
            let name = jsonObject["name"].string,
            let email = jsonObject["email"].string,
            let body = jsonObject["body"].string
            else {
                return nil
        }
        
        self.postId = postId
        self.id = id
        self.name = name
        self.email = email
        self.body = body
    }
}
