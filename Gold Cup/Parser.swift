//
//  Parser.swift
//  Gold Cup
//
//  Created by Janki on 25/06/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import Foundation
class Parser: NSObject {

    class func parseTeam(_ response:Json4Swift_Base,toArray:NSMutableArray, completion:@escaping (_ result: Bool)-> Void){
        toArray.removeAllObjects()
        
        if (response.teams?.count)! > 0{
            for i in 0..<(response.teams?.count)! {
                let result = response.teams![i]
                
                let teamsObj:Team = Team.init(fromDictionary: [:]);
                teamsObj.id = result.id
                teamsObj.name = result.name
                teamsObj.league_name = result.league_name
                teamsObj.logo_small = result.logo_small
                teamsObj.logo_medium = result.logo_medium
                teamsObj.conference = result.conference
                teamsObj.nativ_name_short = result.nativ_name_short
                teamsObj.nativ_name = result.nativ_name
                teamsObj.is_placeholder_team = result.is_placeholder_team
                teamsObj.short_name = result.short_name
                teamsObj.penalties = result.penalties
                teamsObj.total_matches = result.total_matchs
                teamsObj.total_points = result.total_points
                teamsObj.nb = result.nb
                
                toArray.add(teamsObj)
                
            }
            completion(true)
            
        }
        print(toArray)
        
        
        
    }
class func parsePlayer(_ response:Json4Swift_Base,toArray:NSMutableArray, completion:@escaping (_ result: Bool)-> Void){
    toArray.removeAllObjects()
        if (response.player?.count)! > 0{
        for i in 0..<(response.player?.count)! {
            let result = response.player![i]
            
            let playersObj:Players = Players.init(fromDictionary: [:]);
            playersObj.id = result.id
            playersObj.name = result.name
            playersObj.id_team = result.id_team
            toArray.add(playersObj)
        }
        completion(true)
        
    }
    print(toArray)
    }
    class func parseMatches(_ response:Json4Swift_Base,toArray:NSMutableArray, completion:@escaping (_ result: Bool)-> Void){
        toArray.removeAllObjects()
        
        var scoresArray : NSMutableArray!
        if (response.matches?.count)! > 0{
            for i in 0..<(response.matches?.count)! {
                let result = response.matches![i]
                
                let matchesObj:MatchesModel = MatchesModel.init(fromDictionary: [:]);
                matchesObj.homeTeamID = result.homeTeamID
                matchesObj.awayTeamID = result.awayTeamID
                matchesObj.id = result.id
                matchesObj.videoUrl = result.videoUrl
                matchesObj.date = result.date
                matchesObj.stage = result.stage
                matchesObj.awayGoals = result.awayGoals
                matchesObj.homeGoals = result.homeGoals
                matchesObj.homeOdd = result.homeOdd
                matchesObj.awayOdd = result.awayOdd
                matchesObj.drawOdd = result.drawOdd
                matchesObj.awayPenaltyGoals = result.awayPenaltyGoals
                matchesObj.homePenaltyGoals = result.homePenaltyGoals
                matchesObj.flag = result.flag
                matchesObj.matchStatus = result.matchStatus
                
          /*      for j in 0..<(result.scorers?.count)!{
                    let resultScores = result.scorers![j]
                    let scoresObj : ScoresModel = ScoresModel.init(fromDictionary: [ : ])
                    scoresObj.id_jucator = resultScores.id_jucator
                    scoresObj.id_team = resultScores.id_team
                    scoresObj.minute = resultScores.minute
                    scoresObj.ownGoal = resultScores.ownGoal
                    scoresObj.penalityShot = resultScores.penalityShot
                    scoresArray.add(scoresObj)
                    
                }*/
                toArray.add(matchesObj)
            }
            completion(true)
            
        }
        print(toArray)
        
    
    
}}
