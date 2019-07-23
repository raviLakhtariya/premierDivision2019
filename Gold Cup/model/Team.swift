//
//  Team.swift
//  Gold Cup
//
//  Created by Janki on 25/06/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import Foundation
class Team : NSObject {
    
//    "id": "1501",
//    "name": "Malmoe FF",
//    "league_name": "Malmoe FF",
//    "logo_small": "logo-8aef5111b42fa1db9b70a1ff522da24de240b796.png",
//    "logo_medium": "logo-8aef5111b42fa1db9b70a1ff522da24de240b796.png",
//    "penalties": 0,
//    "short_name": "Malmoe FF",
//    "nativ_name": "",
//    "nativ_name_short": "",
//    "is_placeholder_team": "1",
//    "conference": "0",
//    "playoffGroup": "0",
//    "total_points": "0",
//    "total_matchs": "0",
//    "nb": " - 1.0.6"
    
    var id : String!
    var name : String!
    var league_name : String!
    var logo_small : String!
    var logo_medium : String!
    var penalties : Int!
    var short_name : String!
    var nativ_name : String!
    var nativ_name_short : String!
    var is_placeholder_team : String!
    var conference : String!
    var playoffGroup : String!
    var total_points : String!
    var total_matches : String!
    var nb : String!
    
    
    init(fromDictionary dictionary: [String:Any]){
        
        id = (dictionary["id"] as? String) ?? ""
        name = (dictionary["name"] as? String) ?? ""
        league_name = (dictionary["league_name"] as? String) ?? ""
        logo_small = (dictionary["logo_small"] as? String) ?? ""
        logo_medium = (dictionary["logo_medium"] as? String) ?? ""
        penalties = (dictionary["penalties"] as? Int) ?? 0
        short_name = (dictionary["short_name"] as? String) ?? ""
        nativ_name = (dictionary["nativ_name"] as? String) ?? ""
        nativ_name_short = (dictionary["nativ_name_short"] as? String) ?? ""
        is_placeholder_team = (dictionary["is_placeholder_team"] as? String) ?? ""
        conference = (dictionary["conference"] as? String) ?? ""
        playoffGroup = (dictionary["platoffGroup"] as? String) ?? ""
        total_points = (dictionary["total_points"] as? String) ?? ""
        total_matches = (dictionary["total_matches"] as? String) ?? ""
        nb = (dictionary["nb"] as? String) ?? ""
    }
    
    func toDictionary() -> [String:Any] {
        
        var dictionary = [String:Any]()
        
        if id != nil{dictionary["id"] = id}
        if name != nil {dictionary["name"] = name}
        if league_name != nil{dictionary["league_name"] = league_name}
        if logo_small != nil{dictionary["logo_small"] = logo_small}
        if logo_medium != nil{dictionary["logo_medium"] = logo_medium}
        if penalties != nil{dictionary["penalties"] = penalties}
        if short_name != nil{dictionary["short_name"] = short_name}
        if nativ_name != nil{dictionary["nativ_name"] = nativ_name}
        if nativ_name_short != nil{dictionary["nativ_name_short"] = nativ_name_short}
        if is_placeholder_team != nil{dictionary["is_placeholder_team"] = is_placeholder_team}
        if conference != nil{dictionary["conference"] = conference}
        if playoffGroup != nil{dictionary["playoffGroup"] = playoffGroup}
        if total_points != nil{dictionary["total_points"] = total_points}
        if total_matches != nil{dictionary["total_matches"] = total_matches}
        if nb != nil{dictionary["nb"] = nb}
        
        
        return dictionary
        
}
}
