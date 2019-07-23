//
//  ScorreVC.swift
//  Gold Cup
//
//  Created by PRASHANT MAHETA on 30/06/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import UIKit
import Alamofire
class ScorreVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamImg: UIImageView!
    
    @IBOutlet weak var dateSchecdule: UILabel!
    
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var awayTeamImg: UIImageView!
    
    
    @IBOutlet weak var viewLiveMatchScore: UIView!
    
    var arrayTeam : [String]!
    var teamsJsonFetchArray : [Teams]!
    var teamJsonArray : [Team]!
    var arrForPlayer : NSMutableArray = NSMutableArray.init()
    var arrForTeam : NSMutableArray = NSMutableArray.init()
    var teamjson : Team!
    var jsonObj : Json4Swift_Base!
    var teamsJson : Teams!
    var arrForMatches : NSMutableArray = NSMutableArray.init()
    var matchesJson : Matches!
    
    
    var arrofScores : NSMutableArray = NSMutableArray.init()
    var arrofownGoal : NSMutableArray = NSMutableArray.init()
    var arrofawayGoal : NSMutableArray = NSMutableArray.init()
    var arrOFModelScores : Scorers!
    var playersJson : Players!
    var playersJsonArr : [Player]!
    
    @IBOutlet weak var tableView: UITableView!
    var strHomeTeamName : String!
    var strHomeTeamImage : String!
    var strAwayTeamName : String!
    var strAwayTeamImg : String!
    var strDateSchedule : String!
    var strHomeTeamId : String!
    var strAwayTeamId : String!
    var strMatchID : String!
    
    @IBOutlet weak var OwnTeamGoalTxt: UILabel!
    @IBOutlet weak var awayTeamGoalTxt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setup()
    }
    func setup(){
        self.homeTeamImg.clipsToBounds = true
        self.awayTeamImg.clipsToBounds = true
        self.homeTeamImg.layer.cornerRadius = self.homeTeamImg.frame.height / 2.0
        self.awayTeamImg.layer.cornerRadius = self.homeTeamImg.frame.height / 2.0
        
        homeTeamName.text = strHomeTeamName
        awayTeamName.text = strAwayTeamName
        dateSchecdule.text = strDateSchedule
        
        self.OwnTeamGoalTxt.clipsToBounds = true
        self.awayTeamGoalTxt.clipsToBounds = true
        
        self.OwnTeamGoalTxt.layer.masksToBounds = true
        self.awayTeamGoalTxt.layer.masksToBounds = true
        
        self.OwnTeamGoalTxt.layer.cornerRadius = 15.0
        self.awayTeamGoalTxt.layer.cornerRadius = 15.0
        
        viewLiveMatchScore.clipsToBounds = true
        viewLiveMatchScore.layer.cornerRadius = 15.0
        viewLiveMatchScore.layer.masksToBounds = true
        
        tableView.clipsToBounds = true
        tableView.layer.masksToBounds = true
        tableView.layer.cornerRadius = 15.0
        
        
        if (strHomeTeamId != nil) {
            let mainUrl : String = "\(Webservice.LOGO_MEDIUM_URL)" + "\(strHomeTeamId!)" + "/" + "\(strHomeTeamImage!)"
            print(mainUrl)
            if let url = URL(string: mainUrl) {
                print("Download Started")
                getDataFromUrl(url: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    print(response?.suggestedFilename ?? url.lastPathComponent)
                    print("Download Finished")
                    DispatchQueue.main.async() {
                        
                        if self.strHomeTeamId! == "2989" {
                            self.homeTeamImg.image = UIImage.init(named: "asset-no-image")
                            Utility.hideLoading()
                        }else{
                            self.homeTeamImg.image = UIImage(data: data)
                            Utility.hideLoading()
                        }
                        
                    }
                }
                
            }

        }
        if (strAwayTeamId != nil){
            let mainUrl : String = "\(Webservice.LOGO_MEDIUM_URL)" + "\(strAwayTeamId!)" + "/" + "\(strAwayTeamImg!)"
            print(mainUrl)
            if let url = URL(string: mainUrl) {
                print("Download Started")
                getDataFromUrl(url: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    print(response?.suggestedFilename ?? url.lastPathComponent)
                    print("Download Finished")
                    DispatchQueue.main.async() {
                        
                        if self.strAwayTeamId! == "2989" {
                            self.awayTeamImg.image = UIImage.init(named: "asset-no-image")
                            Utility.hideLoading()
                        }else{
                            self.awayTeamImg.image = UIImage(data: data)
                            Utility.hideLoading()
                        }

                    }
                }
                
            }

        }
        dataFecthonQuery()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrofScores == nil {
            return 0
        }else{
            return arrofScores.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let scoreCellObj : ScoreCell = tableView.dequeueReusableCell(withIdentifier: "scorecell") as! ScoreCell
        
        scoreCellObj.contentView.layer.masksToBounds = true
        scoreCellObj.contentView.clipsToBounds = true
        scoreCellObj.contentView.layer.cornerRadius = 15.0
        
        scoreCellObj.mainView.layer.masksToBounds = true
        scoreCellObj.mainView.clipsToBounds = true
        scoreCellObj.mainView.layer.cornerRadius = 15.0
        
        let scoreObjss:ScoresModel = self.arrofScores[indexPath.row]as! ScoresModel
        
        if scoreObjss.id_team == strHomeTeamId {
            scoreCellObj.ownGoalView.isHidden = false
            scoreCellObj.awayGoalVIew.isHidden = true
            
        }
        if scoreObjss.id_team == strAwayTeamId {
            scoreCellObj.ownGoalView.isHidden = true
            scoreCellObj.awayGoalVIew.isHidden = false
        }
        scoreCellObj.id_team.text = scoreObjss.id_team
        scoreCellObj.minute.text = scoreObjss.minute
        
    
        
        
        for i in 0..<self.arrForTeam.count {
            var artmobj : Team = self.arrForTeam.object(at: i) as! Team
            
                        if scoreObjss.id_team == artmobj.id
                        {
                            scoreCellObj.id_jucater.text = artmobj.name!
            }
        }
        
        scoreCellObj.ownGoal.text = scoreObjss.ownGoal
        scoreCellObj.penaltyShot.text = scoreObjss.penalityShot
        scoreCellObj.goalLabel.clipsToBounds = true
        scoreCellObj.goalLabel.layer.cornerRadius = 15.0
        scoreCellObj.awayGoalLabel.clipsToBounds = true
        scoreCellObj.awayGoalLabel.layer.cornerRadius = 15.0

        
        
        
        return scoreCellObj
    }
    @IBAction func onCLickBackBtn(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }

    
    func dataFecthonQuery(){
        
        Utility.showLoading()
        
        let urlString = Webservice.BASE_URL_SEASON
        
        var url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        print(url!)
        var  dictParam : [String : Any] = [:]
        dictParam[PARAMS.id_league] = "59"
        dictParam[PARAMS.id_season] = preferenceHelper.getSeasonId()
        
        Alamofire.request(url!, method: .post, parameters: dictParam, encoding: JSONEncoding.default, headers: nil).responseJSON
            { (response:DataResponse<Any>) in
                let jsonDecoder = JSONDecoder()
                self.jsonObj = try? jsonDecoder.decode(Json4Swift_Base.self, from: response.data!)
                
                if self.jsonObj == nil {
                    Utility.showToast(message: "Retry Again")
                }
                else{
                    Parser.parsePlayer(self.jsonObj, toArray: self.arrForPlayer, completion: { (result) in
                        print(self.arrForPlayer)
                    })
                    
                    
                    Parser.parseTeam(self.jsonObj, toArray: self.arrForTeam, completion: { (result) in
                        print(self.arrForTeam)
                        
                        
                    })
                    
                    Parser.parseMatches(self.jsonObj, toArray: self.arrForMatches, completion: { (result) in
                        print(self.arrForMatches)
                        
                        for i in 0..<self.jsonObj.matches!.count {
                            var plObj : Matches = self.jsonObj.matches![i] as! Matches
                            // var plObj : MatchesModel = self.arrForMatches.object(at: i) as! MatchesModel
                            if self.strMatchID == plObj.id{
                                for j in 0..<self.jsonObj.matches![i].scorers!.count {
                                    var scoresObjs = self.jsonObj.matches![i].scorers![j]
                                    
                                    let strMObj : ScoresModel = ScoresModel.init(fromDictionary: [:])
                                    
                                    
                                    strMObj.id_jucator = scoresObjs.id_jucator
                                    strMObj.id_team = scoresObjs.id_team
                                    strMObj.minute = scoresObjs.minute
                                    strMObj.ownGoal = scoresObjs.ownGoal
                                    strMObj.penalityShot = scoresObjs.penalityShot
                                    self.arrofScores.add(strMObj)
                                    
                                    if strMObj.id_team == self.strHomeTeamId {
                                        self.arrofownGoal.add(strMObj)
                                    }
                                    if strMObj.id_team == self.strAwayTeamId {
                                        self.arrofawayGoal.add(strMObj)
                                    }
                                    
                                }
                                

                            }
                        }
                        Utility.hideLoading()
                      print(self.arrofScores.count)
                        self.OwnTeamGoalTxt.text = String(self.arrofownGoal.count)
                        self.awayTeamGoalTxt.text = String(self.arrofawayGoal.count)
                        self.tableView.reloadData()
                        
                    })
                }
                
        }
    }

}
