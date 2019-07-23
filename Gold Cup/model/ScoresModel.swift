//
//  ScoresModel.swift
//  Gold Cup
//
//  Created by PRASHANT MAHETA on 30/06/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import UIKit

class ScoresModel: NSObject {
    
    var id_jucator : String!
    var id_team : String!
    var minute : String!
    var ownGoal : String!
    var penalityShot : String!
    

    
    init(fromDictionary dictionary: [String:Any]){
        id_jucator = (dictionary["id_jucator"] as? String) ?? ""
        id_team = (dictionary["id_team"] as? String) ?? ""
        minute = (dictionary["minute"] as? String) ?? ""
        ownGoal = (dictionary["ownGoal"] as? String) ?? ""
        penalityShot = (dictionary["penalityShot"] as? String) ?? ""
       
    }
    
    func toDictionary() -> [String:Any] {
        
        var dictionary = [String:Any]()
        if id_jucator != nil{dictionary["id_jucator"] = id_jucator}
        if id_team != nil {dictionary["id_team"] = id_team}
        if minute != nil {dictionary["minute"] = minute}
         if ownGoal != nil {dictionary["ownGoal"] = ownGoal}
         if penalityShot != nil {dictionary["penalityShot"] = penalityShot}
        return dictionary
        
    }
}
