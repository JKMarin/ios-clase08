//
//  APIManager.swift
//  JSONtoClass
//
//  Created by user139236 on 6/1/18.
//  Copyright © 2018 JCMA. All rights reserved.
//

import Foundation
import SwiftyJSON

class APIManager: NSObject{
    let baseURL = "https://jsonplaceholder.typicode.com"
    static let sharedInstance = APIManager()
    static let getPostEndpoint = "/posts/"
    static let getUsersEndpoint = "/users"
    static let getCommentsEndpoint = "/comments"
    
    func getPostWithId(postId: Int, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
        let url : String = baseURL + APIManager.getPostEndpoint + String(postId)
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if(error != nil){
                onFailure(error!)
            } else{
                do{
                    let result = try JSON(data: data!)
                    onSuccess(result)
                } catch{
                    onFailure(error)
                }
            }
        })
        task.resume()
    }
    func getUsers(onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
        let url : String = baseURL + APIManager.getUsersEndpoint
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if(error != nil){
                onFailure(error!)
            } else{
                do{
                    let result = try JSON(data: data!)
                    onSuccess(result)
                } catch{
                    onFailure(error)
                }
            }
        })
        task.resume()
    }
    func getComments(onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
        let url : String = baseURL + APIManager.getCommentsEndpoint
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if(error != nil){
                onFailure(error!)
            } else{
                do{
                    let result = try JSON(data: data!)
                    onSuccess(result)
                } catch{
                    onFailure(error)
                }
            }
        })
        task.resume()
    }
}
