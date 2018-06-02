//
//  UserModel.swift
//  JSONtoClass
//
//  Created by user139236 on 6/2/18.
//  Copyright © 2018 JCMA. All rights reserved.
//

import Foundation
import SwiftyJSON

struct AddressModel {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: (lat: String, lng: String)
}
struct CompanyModel {
    let name: String
    let catchPhrase: String
    let bs: String
}
struct UserModel{
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: AddressModel
    let phone: String
    let website: String
    let company:CompanyModel
}
extension UserModel {
    init?(jsonObject: JSON) {
        guard
            let id = jsonObject["id"].int,
            let name = jsonObject["name"].string,
            let username = jsonObject["username"].string,
            let email = jsonObject["email"].string,
            let phone = jsonObject["phone"].string,
            let website = jsonObject["website"].string
            else {
                return nil
        }
        guard
            let addressJSON = jsonObject["address"].dictionary
            else{
                return nil
        }
        guard
            let companyJSON = jsonObject["company"].dictionary
            else{
                return nil
        }
        let address = AddressModel(street: addressJSON["street"]!.string!, suite: addressJSON["suite"]!.string!, city: addressJSON["city"]!.string!, zipcode:addressJSON["zipcode"]!.string!, geo: (lat: addressJSON["geo"]!["lat"].string!, lng: addressJSON["geo"]!["lng"].string!))
        let company = CompanyModel(name: companyJSON["name"]!.string!, catchPhrase: companyJSON["catchPhrase"]!.string!, bs: companyJSON["bs"]!.string!)
        
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.phone = phone
        self.website = website
        self.address = address
        self.company = company
    }
}
