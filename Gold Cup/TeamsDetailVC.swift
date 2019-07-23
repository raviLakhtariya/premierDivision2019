//
//  TeamsDetailVC.swift
//  Gold Cup
//
//  Created by PRASHANT MAHETA on 24/06/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import UIKit
import Alamofire
class TeamsDetailVC: UIViewController,UITableViewDelegate,UITableViewDataSource {



    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamLeagueName: UILabel!

    @IBOutlet weak var teamPenalties: UILabel!
    @IBOutlet weak var teamTotalMatches: UILabel!
    @IBOutlet weak var teamPlayoffgroup: UILabel!
    @IBOutlet weak var teamTotalPoints: UILabel!
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var lblvaluepenalties: UILabel!
    @IBOutlet weak var lblvalueTotalMatches: UILabel!
    @IBOutlet weak var lblvalueTotalPoints: UILabel!
    @IBOutlet weak var lblvaluePlayoffGroup: UILabel!
    
    var playersTeam : NSMutableArray = NSMutableArray.init()
    
  //  var playerDetailarr : [Player]!
   // var playerDetailObj : Player
        var jsonObj : Json4Swift_Base!
    
    var strTeamName : String!
    var strTeamId : String!
    var strTeamLeagueName : String!
    var strTeamPenalties : String!
    var strTeamTotalMatches : String!
    var strTeamTotalPoints : String!
    var strTeamPlayoffGroup : String!
    var strTeamImageName : String!
    
    @IBOutlet weak var teamImgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    setUp()
    dataFecthonQuery()
    }
    
    func setUp(){
        teamName.text = strTeamName
        teamLeagueName.text = strTeamLeagueName
        lblvaluepenalties.text = strTeamPenalties
        lblvalueTotalMatches.text = strTeamTotalMatches
        lblvalueTotalPoints.text = strTeamTotalPoints
        lblvaluePlayoffGroup.text = strTeamPlayoffGroup
        self.teamImgView.clipsToBounds = true
        self.teamImgView.layer.cornerRadius = self.teamImgView.frame.height / 2.0
        

        let mainUrl : String = "\(Webservice.LOGO_MEDIUM_URL)" + "\(strTeamId!)" + "/" + "\(strTeamImageName!)"
        print(mainUrl)
        if let url = URL(string: mainUrl) {
            Utility.showLoading()
            print("Download Started")
            getDataFromUrl(url: url) { data, response, error in
                guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? url.lastPathComponent)
                print("Download Finished")
                DispatchQueue.main.async() {
                    if self.strTeamId! == "2989"{
                        self.teamImgView.image = UIImage.init(named: "asset-no-image")
                        Utility.hideLoading()
                    }else{
                        self.teamImgView.image = UIImage(data: data)
                        Utility.hideLoading()

                    }
                }
            }
        }
    }
    
    @IBAction func onClickBackBtn(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Players"
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if playersTeam == nil {
            return 0
        }
        else
        {
           return playersTeam.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let playerDetailCellObj: playerDetailCell = self.tableview.dequeueReusableCell(withIdentifier: "playerdetailcell") as! playerDetailCell
     //   let playerDetailCellObj : playerDetailCell = tableView.dequeueReusableCell(withIdentifier: "playerdetaillcell") as! playerDetailCell
        var playerteamobj : Players = self.playersTeam[indexPath.row] as! Players
        playerDetailCellObj.playerNameLbl.text = playerteamobj.name
        return playerDetailCellObj
    }
    
    
 
    func dataFecthonQuery(){
        
        Utility.showLoading()
        
        let urlString = Webservice.BASE_URL_SEASON
        
        var url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        print(url!)
        var  dictParam : [String : Any] = [:]
        dictParam[PARAMS.id_league] = "59"
        dictParam[PARAMS.id_season] = preferenceHelper.getSeasonId()
        /*let parameters = [
         PARAMS.id_league: "365",
         PARAMS.id_season : "564"
         ]*/
        Alamofire.request(url!, method: .post, parameters: dictParam, encoding: JSONEncoding.default, headers: nil).responseJSON
            { (response:DataResponse<Any>) in
                let jsonDecoder = JSONDecoder()
                self.jsonObj = try? jsonDecoder.decode(Json4Swift_Base.self, from: response.data!)
                
                for i in 0..<self.jsonObj.player!.count {
                    if self.strTeamId == self.jsonObj.player![i].id_team {
                        let playerObjs : Players = Players.init(fromDictionary: [:])
                        playerObjs.id = self.jsonObj.player![i].id
                        playerObjs.name = self.jsonObj.player![i].name
                        
                        self.playersTeam.add(playerObjs)
                       
                    }
                }
                 self.tableview.reloadData()
        }
        
    }
    
}

