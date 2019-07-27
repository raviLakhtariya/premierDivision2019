//
//  MatchesVC.swift
//  Gold Cup
//
//  Created by PRASHANT MAHETA on 24/06/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import UIKit
import Alamofire

class MatchesVC: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var CountDown: UILabel!
    
    @IBOutlet weak var viewtable: UIView!
    var timeIsOn : Bool = false
    var timer = Timer()
    var arrayTeam : [String]!
    var teamsJsonFetchArray : [Teams]!
    var teamJsonArray : [Team]!
    var arrForPlayer : NSMutableArray = NSMutableArray.init()
    var arrForTeam : NSMutableArray = NSMutableArray.init()
    var teamjson : Team!
    var jsonObj : Json4Swift_Base!
    var teamsJson : Teams!
    @IBOutlet weak var segmentBtn: UISegmentedControl!
    
    var playersJson : Players!
    var playersJsonArr : [Player]!
    @IBOutlet weak var tableview: UITableView!
    
    var arrForMatches : NSMutableArray = NSMutableArray.init()
    var arrForPastMatches : NSMutableArray = NSMutableArray.init()
    var arrForliveMatches : NSMutableArray = NSMutableArray.init()
    var arrForFutureMathces : NSMutableArray = NSMutableArray.init()
    var matchesJson : Matches!
    var selectedIndex : NSInteger!
    
    var DefaultFormatStr = "0000-00-00 00:00:00"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentBtn.selectedSegmentIndex = 1
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func onClickBackBtn(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    func initialViewSetup(){
        self.tableview.clipsToBounds = true
        self.tableview.layer.masksToBounds = true
        self.tableview.layer.cornerRadius = 15.0
        self.viewtable.layer.cornerRadius = 15.0
        self.viewtable.layer.masksToBounds = true
        self.viewtable.clipsToBounds = true
        self.viewtable.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.arrForliveMatches.removeAllObjects()
        self.arrForPastMatches.removeAllObjects()
        self.arrForFutureMathces.removeAllObjects()
        initialViewSetup()
        dataFecthonQuery()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.viewtable.isHidden = true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentBtn.selectedSegmentIndex == 0 {
            if arrForPastMatches == nil {
                return 0
            }else{
                return arrForPastMatches.count
            }
        }else if segmentBtn.selectedSegmentIndex == 1 {
            if arrForliveMatches == nil {
                
                
                return 0
            }else{
                return arrForliveMatches.count
            }
        }else {
            if arrForFutureMathces == nil {
                
                return 0
            }else{
                return arrForFutureMathces.count
            }
     }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let matchesCellObj : MatchesCell = tableView.dequeueReusableCell(withIdentifier: "matchescell") as! MatchesCell
       
        matchesCellObj.homeTeamImg.clipsToBounds = true
        matchesCellObj.homeTeamImg.layer.cornerRadius = matchesCellObj.homeTeamImg.frame.height / 2.0
        
        matchesCellObj.awayTeamImg.clipsToBounds = true
        matchesCellObj.awayTeamImg.layer.cornerRadius  = matchesCellObj.awayTeamImg.frame.height / 2.0
     
        if selectedIndex == indexPath.row {
            self.animateZoomForCell(zoomeCell: matchesCellObj)
        }else{
            self.animateZoomForCellRemove(zoomCell: matchesCellObj)
        }

        matchesCellObj.mainVIew.clipsToBounds = true
        matchesCellObj.mainVIew.layer.masksToBounds = true
        matchesCellObj.mainVIew.layer.cornerRadius = 15.0
        
        if segmentBtn.selectedSegmentIndex == 0 {
           let matchesObj:MatchesModel = self.arrForPastMatches[indexPath.row]as! MatchesModel
            for i in 0..<(arrForTeam.count){
                var artmobj : Team = self.arrForTeam.object(at: i) as! Team
                
                if matchesObj.homeTeamID == artmobj.id{
                    matchesCellObj.homeTeamName.text = artmobj.name!
                    
                    let mainUrl : String = "\(Webservice.LOGO_MEDIUM_URL)" + "\(artmobj.id!)" + "/" + "\(artmobj.logo_medium!)"
                    print(mainUrl)
                    if let url = URL(string: mainUrl) {
                        print("Download Started")
                        getDataFromUrl(url: url) { data, response, error in
                            guard let data = data, error == nil else { return }
                            print(response?.suggestedFilename ?? url.lastPathComponent)
                            print("Download Finished")
                            DispatchQueue.main.async() {
                                //  matchesCellObj.homeTeamImg.image = UIImage(data: data)
                                
                                if artmobj.id! == "2989" {
                                    matchesCellObj.homeTeamImg.image = UIImage.init(named: "asset-no-image")
                          //          Utility.hideLoading()
                                }else{
                                    matchesCellObj.homeTeamImg.image = UIImage(data: data)
                              //      Utility.hideLoading()
                                }
                            }
                        }
                    }
                }
                if matchesObj.awayTeamID == artmobj.id {
                    matchesCellObj.awayTeamName.text = artmobj.name!
                    let mainUrl : String = "\(Webservice.LOGO_MEDIUM_URL)" + "\(artmobj.id!)" + "/" + "\(artmobj.logo_medium!)"
                    print(mainUrl)
                    if let url = URL(string: mainUrl) {
                        print("Download Started")
                        getDataFromUrl(url: url) { data, response, error in
                            guard let data = data, error == nil else { return }
                            print(response?.suggestedFilename ?? url.lastPathComponent)
                            print("Download Finished")
                            DispatchQueue.main.async() {
                                if artmobj.id! == "2989" {
                                    matchesCellObj.awayTeamImg.image = UIImage.init(named: "asset-no-image")
                        //            Utility.hideLoading()
                                }else{
                                    matchesCellObj.awayTeamImg.image = UIImage(data: data)
                        //            Utility.hideLoading()
                                }
                            }
                        }
                    }
                }
            }
            matchesCellObj.timeSchedule.text = matchesObj.date
   
        }else if segmentBtn.selectedSegmentIndex == 1 {
           
            let matchesObj:MatchesModel = self.arrForliveMatches[indexPath.row]as! MatchesModel
            
            for i in 0..<(arrForTeam.count){
                var artmobj : Team = self.arrForTeam.object(at: i) as! Team
                
                if matchesObj.homeTeamID == artmobj.id{
                    matchesCellObj.homeTeamName.text = artmobj.name!
                    
                    let mainUrl : String = "\(Webservice.LOGO_MEDIUM_URL)" + "\(artmobj.id!)" + "/" + "\(artmobj.logo_medium!)"
                    print(mainUrl)
                    if let url = URL(string: mainUrl) {
                        print("Download Started")
                        getDataFromUrl(url: url) { data, response, error in
                            guard let data = data, error == nil else { return }
                            print(response?.suggestedFilename ?? url.lastPathComponent)
                            print("Download Finished")
                            DispatchQueue.main.async() {
                                //  matchesCellObj.homeTeamImg.image = UIImage(data: data)
                                
                                if artmobj.id! == "2989" {
                                    matchesCellObj.homeTeamImg.image = UIImage.init(named: "asset-no-image")
                            //        Utility.hideLoading()
                                }else{
                                    matchesCellObj.homeTeamImg.image = UIImage(data: data)
                             //       Utility.hideLoading()
                                }
                            }
                        }
                    }
                }
                if matchesObj.awayTeamID == artmobj.id {
                    matchesCellObj.awayTeamName.text = artmobj.name!
                    let mainUrl : String = "\(Webservice.LOGO_MEDIUM_URL)" + "\(artmobj.id!)" + "/" + "\(artmobj.logo_medium!)"
                    print(mainUrl)
                    if let url = URL(string: mainUrl) {
                        print("Download Started")
                        getDataFromUrl(url: url) { data, response, error in
                            guard let data = data, error == nil else { return }
                            print(response?.suggestedFilename ?? url.lastPathComponent)
                            print("Download Finished")
                            DispatchQueue.main.async() {
                                if artmobj.id! == "2989" {
                                    matchesCellObj.awayTeamImg.image = UIImage.init(named: "asset-no-image")
                               //     Utility.hideLoading()
                                }else{
                                    matchesCellObj.awayTeamImg.image = UIImage(data: data)
                                //    Utility.hideLoading()
                                }
                            }
                        }
                    }
                }
            }
            matchesCellObj.timeSchedule.text = matchesObj.date
        }else {
           let matchesObj:MatchesModel = self.arrForFutureMathces[indexPath.row]as! MatchesModel
       
            for i in 0..<(arrForTeam.count){
                var artmobj : Team = self.arrForTeam.object(at: i) as! Team
                
                if matchesObj.homeTeamID == artmobj.id{
                    matchesCellObj.homeTeamName.text = artmobj.name!
                    
                    let mainUrl : String = "\(Webservice.LOGO_MEDIUM_URL)" + "\(artmobj.id!)" + "/" + "\(artmobj.logo_medium!)"
                    print(mainUrl)
                    if let url = URL(string: mainUrl) {
                        print("Download Started")
                        getDataFromUrl(url: url) { data, response, error in
                            guard let data = data, error == nil else { return }
                            print(response?.suggestedFilename ?? url.lastPathComponent)
                            print("Download Finished")
                            DispatchQueue.main.async() {
                                if artmobj.id! == "2989" {
                                    matchesCellObj.homeTeamImg.image = UIImage.init(named: "asset-no-image")
                              //      Utility.hideLoading()
                                }else{
                                    matchesCellObj.homeTeamImg.image = UIImage(data: data)
                                //    Utility.hideLoading()
                                }
                            }
                        }
                    }
                }
                if matchesObj.awayTeamID == artmobj.id {
                    matchesCellObj.awayTeamName.text = artmobj.name!
                    let mainUrl : String = "\(Webservice.LOGO_MEDIUM_URL)" + "\(artmobj.id!)" + "/" + "\(artmobj.logo_medium!)"
                    print(mainUrl)
                    if let url = URL(string: mainUrl) {
                        print("Download Started")
                        getDataFromUrl(url: url) { data, response, error in
                            guard let data = data, error == nil else { return }
                            print(response?.suggestedFilename ?? url.lastPathComponent)
                            print("Download Finished")
                            DispatchQueue.main.async() {
                                if artmobj.id! == "2989" {
                                    matchesCellObj.awayTeamImg.image = UIImage.init(named: "asset-no-image")
                               //     Utility.hideLoading()
                                }else{
                                    matchesCellObj.awayTeamImg.image = UIImage(data: data)
                                //    Utility.hideLoading()
                                }
                            }
                        }
                    }
                }
            }
            matchesCellObj.timeSchedule.text = matchesObj.date
        }
        return matchesCellObj
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var scoreObj : ScorreVC = self.storyboard?.instantiateViewController(withIdentifier: "scorevc")as! ScorreVC
        
        if segmentBtn.selectedSegmentIndex == 0 {
          let matchesObj:MatchesModel = self.arrForPastMatches[indexPath.row]as! MatchesModel
            for i in 0..<(arrForTeam.count){
                var artmobj : Team = self.arrForTeam.object(at: i) as! Team
                scoreObj.strDateSchedule = matchesObj.date
                scoreObj.strMatchID = matchesObj.id
                if matchesObj.homeTeamID == artmobj.id{
                    scoreObj.strHomeTeamName = artmobj.name
                    scoreObj.strHomeTeamId = matchesObj.homeTeamID
                    scoreObj.strHomeTeamImage = artmobj.logo_small
                }
                if matchesObj.awayTeamID == artmobj.id {
                    scoreObj.strAwayTeamName = artmobj.name
                    scoreObj.strAwayTeamImg = artmobj.logo_small
                    scoreObj.strAwayTeamId = matchesObj.awayTeamID
                }
            }
            if matchesObj.videoUrl == "" {
                
            }else{
                scoreObj.strVideoURl = matchesObj.videoUrl
                
            }
        }else if segmentBtn.selectedSegmentIndex == 1 {
          let matchesObj:MatchesModel = self.arrForliveMatches[indexPath.row]as! MatchesModel
            for i in 0..<(arrForTeam.count){
                var artmobj : Team = self.arrForTeam.object(at: i) as! Team
                scoreObj.strDateSchedule = matchesObj.date
                scoreObj.strMatchID = matchesObj.id
                if matchesObj.homeTeamID == artmobj.id{
                    scoreObj.strHomeTeamName = artmobj.name
                    scoreObj.strHomeTeamId = matchesObj.homeTeamID
                    scoreObj.strHomeTeamImage = artmobj.logo_small
                }
                if matchesObj.awayTeamID == artmobj.id {
                    scoreObj.strAwayTeamName = artmobj.name
                    scoreObj.strAwayTeamImg = artmobj.logo_small
                    scoreObj.strAwayTeamId = matchesObj.awayTeamID
                }
            }
            if matchesObj.videoUrl == "" {
                
            }else{
                scoreObj.strVideoURl = matchesObj.videoUrl
                
            }
        }else {
           let matchesObj:MatchesModel = self.arrForFutureMathces[indexPath.row]as! MatchesModel
            for i in 0..<(arrForTeam.count){
                var artmobj : Team = self.arrForTeam.object(at: i) as! Team
                scoreObj.strDateSchedule = matchesObj.date
                scoreObj.strMatchID = matchesObj.id
                if matchesObj.homeTeamID == artmobj.id{
                    scoreObj.strHomeTeamName = artmobj.name
                    scoreObj.strHomeTeamId = matchesObj.homeTeamID
                    scoreObj.strHomeTeamImage = artmobj.logo_small
                    
                }
                if matchesObj.awayTeamID == artmobj.id {
                    scoreObj.strAwayTeamName = artmobj.name
                    scoreObj.strAwayTeamImg = artmobj.logo_small
                    scoreObj.strAwayTeamId = matchesObj.awayTeamID
                    
                }
                
            }
            if matchesObj.videoUrl == "" {
                
            }else{
                scoreObj.strVideoURl = matchesObj.videoUrl
                
            }
            
        }
        self.navigationController?.pushViewController(scoreObj, animated: true)
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
    func dataFecthonQuery(){
        
      //  Utility.showLoading()
        
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
                //        Utility.hideLoading()
                        if self.segmentBtn.selectedSegmentIndex == 1 {
                            var currentdate =  self.GetOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd HH:mm:ss", conVertFormate: "yyyy-MM-dd", convertDate:self.currentDate() as! NSString) as String
                          
                        for i in 0..<self.arrForMatches.count{
                            let matchesObj:MatchesModel = self.arrForMatches[i]as! MatchesModel
                            
                            if matchesObj.date == nil || matchesObj.date == self.DefaultFormatStr {
                                
                            }else{
                                var matchesObjDateStr = self.GetOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd HH:mm:ss", conVertFormate: "yyyy-MM-dd", convertDate:matchesObj.date as! NSString) as String
                                
                                    if currentdate == matchesObjDateStr{
                                        self.arrForliveMatches.add(matchesObj)
                                    }
                                }
                            }
                            if self.arrForliveMatches.count == 0 {
                                self.setView(view: self.viewtable, hidden: false)
                            }
                                   self.tableview.reloadData()
                        }
                    })
                }
            }
        }
    
    @IBAction func onClickSegmentBtn(_ sender: Any) {
        var currentdate =  self.GetOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd HH:mm:ss", conVertFormate: "yyyy-MM-dd", convertDate:self.currentDate() as! NSString) as String
        
        if segmentBtn.selectedSegmentIndex == 0 {
        self.arrForPastMatches.removeAllObjects()
            for i in 0..<self.arrForMatches.count{
                let matchesObj:MatchesModel = self.arrForMatches[i]as! MatchesModel
            
                if matchesObj.date == nil || matchesObj.date == self.DefaultFormatStr {
                    
                }else{
                    var matchesObjDateStr = self.GetOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd HH:mm:ss", conVertFormate: "yyyy-MM-dd", convertDate:matchesObj.date as! NSString) as String
                    
                        if currentdate > matchesObjDateStr{
                            arrForPastMatches.add(matchesObj)
                        }
                    }
                }
            if self.arrForPastMatches.count == 0 {
                self.setView(view: self.viewtable, hidden: false)
            }else{
                 self.setView(view: self.viewtable, hidden: true)
                self.tableview.reloadData()
            }
            
        }else if segmentBtn.selectedSegmentIndex == 1 {
            self.arrForliveMatches.removeAllObjects()
                for i in 0..<self.arrForMatches.count{
                    let matchesObj:MatchesModel = self.arrForMatches[i]as! MatchesModel
              
                    if matchesObj.date == nil || matchesObj.date == self.DefaultFormatStr {
                    }else{
                    
                        var matchesObjDateStr = self.GetOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd HH:mm:ss", conVertFormate: "yyyy-MM-dd", convertDate:matchesObj.date as! NSString) as String
                    
                        if currentdate == matchesObjDateStr{
                    
                            
                            arrForliveMatches.add(matchesObj)
                    }
                }
            }
            if self.arrForliveMatches.count == 0 {
                self.setView(view: self.viewtable, hidden: false)
            }else{
                self.setView(view: self.viewtable, hidden: true)
                self.tableview.reloadData()
            }
            
        }else{
            self.arrForFutureMathces.removeAllObjects()
            
            for i in 0..<self.arrForMatches.count{
                let matchesObj:MatchesModel = self.arrForMatches[i]as! MatchesModel

                if matchesObj.date == nil || matchesObj.date == self.DefaultFormatStr {
                    
                }else{
                    var matchesObjDateStr = self.GetOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd HH:mm:ss", conVertFormate: "yyyy-MM-dd", convertDate:matchesObj.date as! NSString) as String
                    
                    if currentdate < matchesObjDateStr{
                        arrForFutureMathces.add(matchesObj)
                    }
                }
            }
            if self.arrForFutureMathces.count == 0 {
                self.setView(view: viewtable, hidden: false)
            }else{
                self.setView(view: viewtable, hidden: true)
                self.tableview.reloadData()
            }

        }
        
    }
    func animateZoomForCell(zoomeCell : UITableViewCell){
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            zoomeCell.transform = CGAffineTransform.init(scaleX: 1.6, y: 1.6)
        }, completion: nil)
      
    }
    func animateZoomForCellRemove(zoomCell : UITableViewCell){
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            zoomCell.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        
    }

    func currentDate()->String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: date)
    }
    
    func GetOnlyDateMonthYearFromFullDate(currentDateFormate:NSString , conVertFormate:NSString , convertDate:NSString ) -> NSString
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = currentDateFormate as String
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let finalDate = formatter.date(from: convertDate as String)
        formatter.dateFormat = conVertFormate as String
        print(finalDate!)
        let dateString = formatter.string(from: finalDate!)
        return dateString as NSString
    }
    
    func setView(view: UIView, hidden: Bool) {
     //   UIView.transition(with: view, duration: 0, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
      //  })
    }
}
