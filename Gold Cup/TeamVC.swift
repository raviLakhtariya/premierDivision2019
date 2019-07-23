//
//  TeamVC.swift
//  Gold Cup
//
//  Created by PRASHANT MAHETA on 24/06/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import UIKit
import Alamofire
class TeamVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var arrayTeam : [String]!
    var teamsJsonFetchArray : [Teams]!
    var teamJsonArray : [Team]!

    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
var arrForTeamPlayer : NSMutableArray = NSMutableArray.init()
    var arrForTeam : NSMutableArray = NSMutableArray.init()
    var teamjson : Team!
    var jsonObj : Json4Swift_Base!
    var teamsJson : Teams!
    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataFecthonQuery()
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickBackBtn(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if arrForTeam == nil {
            return 0
        }else{
            return arrForTeam.count
        }
    }


    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let teamCellObj : TeamCell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamscell", for: indexPath) as! TeamCell
        
  
      
        
        teamCellObj.contentView.layer.borderWidth = 1.0
        teamCellObj.contentView.layer.cornerRadius = 15.0
        teamCellObj.cellImgView.clipsToBounds = true
        teamCellObj.cellImgView.layer.cornerRadius = teamCellObj.cellImgView.frame.height / 2.0
        
        let teammObj:Team = self.arrForTeam[indexPath.row]as! Team
        teamCellObj.cellLbl.text = teammObj.name!
    
        let mainUrl : String = "\(Webservice.LOGO_MEDIUM_URL)" + "\(teammObj.id!)" + "/" + "\(teammObj.logo_small!)"
        print(mainUrl)
        if let url = URL(string: mainUrl) {
            Utility.showLoading()
            print("Download Started")
            getDataFromUrl(url: url) { data, response, error in
                guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? url.lastPathComponent)
                print("Download Finished")
                DispatchQueue.main.async() {
                    
                    print(response)
                    if teammObj.id! == "2989" {
                        teamCellObj.cellImgView.image = UIImage.init(named: "asset-no-image")
                         Utility.hideLoading()
                    }else{
                         teamCellObj.cellImgView.image = UIImage(data: data)
                        Utility.hideLoading()
                    }
                   
                }
            }
     
            
        }
                return teamCellObj
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       var teammObj:Team = self.arrForTeam[indexPath.row]as! Team

        let teamDetailObj : TeamsDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "teamsdetailvc") as! TeamsDetailVC
        teamDetailObj.strTeamId = teammObj.id
        teamDetailObj.strTeamName = teammObj.name
        teamDetailObj.strTeamLeagueName = teammObj.league_name
        teamDetailObj.strTeamTotalMatches = teammObj.total_matches
        teamDetailObj.strTeamTotalPoints = teammObj.total_points
        teamDetailObj.strTeamPenalties = String(teammObj.penalties)
        teamDetailObj.strTeamPlayoffGroup = teammObj.playoffGroup
        teamDetailObj.strTeamImageName = teammObj.logo_medium!
        self.navigationController?.pushViewController(teamDetailObj, animated: true)
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
                Parser.parseTeam(self.jsonObj, toArray: self.arrForTeam, completion: { (result) in
                    print(self.arrForTeam)
                    Utility.hideLoading()
                    self.collectionview.reloadData()
                })

        }
        
    }

}/*now need to decide matches screen and player flow*/
