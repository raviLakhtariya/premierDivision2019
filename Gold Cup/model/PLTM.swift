//
//  PLTM.swift
//  Gold Cup
//
//  Created by Janki on 26/06/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import UIKit

class PLTM: NSObject {
    var id : String!
    var name : String!
    var logo_small : String!
    var id_team : String!
    var team_name : String!
    
    override init() {
        
    }

    init(fromDictionary dictionary: [String:Any]){
        id = (dictionary["id"] as? String) ?? ""
        name = (dictionary["name"] as? String) ?? ""
        id_team = (dictionary["id_team"] as? String) ?? ""
        logo_small = (dictionary["logo_small"] as? String) ?? ""
        team_name = (dictionary["team_name"] as? String) ?? ""
    }
    
    func toDictionary() -> [String:Any] {
        
        var dictionary = [String:Any]()
        if id != nil{dictionary["id"] = id}
        if name != nil {dictionary["name"] = name}
        if id_team != nil{dictionary["id_team"] = id_team}
        if logo_small != nil{dictionary["logo_small"] = logo_small}
        if team_name != nil{dictionary["team_name"] = team_name}
        
        return dictionary
        
    }
}
