//
//  PlayerTeam.swift
//  Gold Cup
//
//  Created by Janki on 26/06/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import Foundation
class PlayerTeam : NSObject {
    
    var id : String!
    var name : String!
    var logo_small : String!
    var pltm : [PLTM]!
    
    init(fromDictionary dictionary: [String:Any]){
        id = (dictionary["id"] as? String) ?? ""
        name = (dictionary["name"] as? String) ?? ""
        logo_small = (dictionary["name"] as? String) ?? ""

        pltm = [PLTM]()
        if let listArray = dictionary["pltm"] as? [[String:Any]]{
            for dic in listArray{
                let value = PLTM(fromDictionary: dic)
                pltm.append(value)
            }
        }    }
    
    func toDictionary() -> [String:Any] {
        
        var dictionary = [String:Any]()
        if id != nil{dictionary["id"] = id}
        if name != nil {dictionary["name"] = name}
        if logo_small != nil {dictionary["logo_small"] = logo_small}
        if pltm != nil{
            var dictionaryElements = [[String:Any]]()
            for listElement in pltm {
                dictionaryElements.append(listElement.toDictionary())
            }
            dictionary["pltm"] = dictionaryElements
        }
        return dictionary
        
    }
}


