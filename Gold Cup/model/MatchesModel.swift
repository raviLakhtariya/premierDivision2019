//
//  MatchesModel.swift
//  Gold Cup
//
//  Created by PRASHANT MAHETA on 30/06/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import UIKit

class MatchesModel: NSObject {
    
    
    var homeTeamID : String!
    var awayTeamID : String!
    var id : String!
    var date : String!
    var matchStatus : String!
    var flag : String!
    var homeGoals : String!
    
    var awayGoals : String!
    
    var homePenaltyGoals : String!
    var awayPenaltyGoals : String!
    var stage : String!
    var videoUrl : String!
    var tvPost : String!
    var liveMinute : String!
    var homeOdd : String!
    var awayOdd : String!
    var drawOdd : String!
    var scorers : [ScoresModel]!
    var logo_small : String!
    
    
    
    
//
//    var id : String!
//    var name : String!
//    var logo_small : String!
//    var pltm : [PLTM]!
    
    init(fromDictionary dictionary: [String:Any]){
        homeTeamID = (dictionary["homeTeamID"] as? String) ?? ""
        
        awayTeamID = (dictionary["awayTeamID"] as? String) ?? ""
        id = (dictionary["id"] as? String) ?? ""
        logo_small = (dictionary["name"] as? String) ?? ""
        date = (dictionary["date"] as? String) ?? ""
        flag = (dictionary["flag"] as? String) ?? ""
        matchStatus = (dictionary["matchStatus"] as? String) ?? ""
        homeGoals = (dictionary["homeGoals"] as? String) ?? ""
        awayGoals = (dictionary["awayGoals"] as? String) ?? ""
        homePenaltyGoals = (dictionary["homePenaltyGoals"] as? String) ?? ""
        awayPenaltyGoals = (dictionary["awayPenaltyGoals"] as? String) ?? ""
        stage = (dictionary["stage"] as? String) ?? ""
        videoUrl = (dictionary["videoUrl"] as? String) ?? ""
        tvPost = (dictionary["tvPost"] as? String) ?? ""
        liveMinute = (dictionary["liveMinute"] as? String) ?? ""
        homeOdd = (dictionary["homeOdd"] as? String) ?? ""
        awayOdd = (dictionary["awayOdd"] as? String) ?? ""
        drawOdd = (dictionary["drawOdd"] as? String) ?? ""
       // scorers = (dictionary["scorers"] as? String) ?? ""
        
        
        scorers = [ScoresModel]()
        if let listArray = dictionary["Scorers"] as? [[String:Any]]{
            for dic in listArray{
                let value = ScoresModel(fromDictionary: dic)
                scorers.append(value)
            }
        }    }
    
    func toDictionary() -> [String:Any] {
        
        var dictionary = [String:Any]()
        if homeTeamID != nil{dictionary["homeTeamID"] = homeTeamID}
        if awayTeamID != nil {dictionary["awayTeamID"] = awayTeamID}
        if id != nil {dictionary["id"] = id}
        if logo_small != nil {dictionary["logo_small"] = logo_small}
        if date != nil {dictionary["date"] = date}
        if flag != nil {dictionary["flag"] = flag}
        if matchStatus != nil {dictionary["matchStatus"] = matchStatus}
        if homeGoals != nil {dictionary["homeGoals"] = homeGoals}
        if awayGoals != nil {dictionary["awayGoals"] = awayGoals}
        if homePenaltyGoals != nil {dictionary["homePenaltyGoals"] = homePenaltyGoals}
        if awayPenaltyGoals != nil {dictionary["awayPenaltyGoals"] = awayPenaltyGoals}
        if stage != nil {dictionary["stage"] = stage}
        if videoUrl != nil {dictionary["videoUrl"] = videoUrl}
        if tvPost != nil {dictionary["tvPost"] = tvPost}
        if liveMinute != nil {dictionary["liveMinute"] = liveMinute}
        if homeOdd != nil {dictionary["homeOdd"] = homeOdd}
        if awayOdd != nil {dictionary["awayOdd"] = awayOdd}
        if drawOdd != nil {dictionary["drawOdd"] = drawOdd}
        
        
        
        
        if scorers != nil{
            var dictionaryElements = [[String:Any]]()
            for listElement in scorers {
                dictionaryElements.append(listElement.toDictionary())
            }
            dictionary["pltm"] = dictionaryElements
        }
        return dictionary
        
    }
}
