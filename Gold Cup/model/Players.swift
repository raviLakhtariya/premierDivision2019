
//
//  Players.swift
//  Gold Cup
//
//  Created by Janki on 25/06/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import UIKit

class Players: NSObject {

        var id : String!
        var name : String!
        var logo_small : String!
        var id_team : String!
        
        init(fromDictionary dictionary: [String:Any]){
            id = (dictionary["id"] as? String) ?? ""
            name = (dictionary["name"] as? String) ?? ""
            id_team = (dictionary["id_team"] as? String) ?? ""
//logo_small = (dictionary["logo_small"] as? String) ?? ""
        }
    override init() {
        
    }
    func toDictionary() -> [String:Any] {
            
            var dictionary = [String:Any]()
            if id != nil{dictionary["id"] = id}
            if name != nil {dictionary["name"] = name}
            if id_team != nil{dictionary["id_team"] = id_team}
//if logo_small != nil{dictionary["logo_small"] = logo_small}
           
            return dictionary
            
        }
}
