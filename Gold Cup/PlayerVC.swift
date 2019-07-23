//
//  PlayerVC.swift
//  Gold Cup
//
//  Created by PRASHANT MAHETA on 24/06/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import UIKit
import Alamofire
class PlayerVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    
    

    
    @IBOutlet weak var viewForPIcker: UIView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var chooseTeamBtn: UIButton!
    var arrayTeam : [String]!
    var teamsJsonFetchArray : [Teams]!
    var teamJsonArray : [Team]!
    var arrForPlayer : NSMutableArray = NSMutableArray.init()
    var arrForTeam : NSMutableArray = NSMutableArray.init()
    var arrForPLTM : NSMutableArray = NSMutableArray.init()
    var arrFOrPLTMFilter : NSMutableArray = NSMutableArray.init()
    var arrForPlayerTeam : NSMutableArray = NSMutableArray.init()
    var arrForSearchPlayer : NSMutableArray = NSMutableArray.init()
    var teamjson : Team!
    var jsonObj : Json4Swift_Base!
    var teamsJson : Teams!
    var textString : String!
    var playersJson : Players!
    var playersJsonArr : [Player]!
    var idStr : String!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTxtField: UITextField!
    @IBOutlet weak var closeBtn: UIButton!
    var isTogglePickerView : Bool!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var filterdOrNot : Bool? = false

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onClickBackBtn(_ sender: Any) {
            _ = self.navigationController?.popViewController(animated: true)
    }

    
    
    func setup(){
        setLeftViewImageTextField()
        self.searchView.isHidden = true
        filterdOrNot = false
        isTogglePickerView = true
        viewForPIcker.isHidden = true
        lblTitle.text = "Select Team"
    }
    
 
    
    func setLeftViewImageTextField(){
        searchTxtField.leftViewMode = UITextField.ViewMode.always
        searchTxtField.leftViewMode = .always
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        var image = UIImage.init(named: "Search Icon.png")
        imageView.image = image;
        searchTxtField.leftView = imageView
    }
    @IBAction func onClickSearchBtn(_ sender: Any) {
        self.searchView.isHidden = false
        self.searchTxtField.becomeFirstResponder()
    }
    @IBAction func onClickBack2Btn(_ sender: Any) {
        self.searchView.isHidden = true
        self.searchTxtField.text = ""
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func closeSearchViewBtn(_ sender: Any) {
        self.searchView.isHidden = true
        self.searchTxtField.text = ""
           }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.arrForSearchPlayer.removeAllObjects()
        if arrForSearchPlayer == nil {
            filterdOrNot = false
        }
        tableview.reloadData()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      
        self.arrForSearchPlayer.removeAllObjects()
        if textField == searchTxtField {
            return FilterArray()
        }
        return true
    }
    func FilterArray()->Bool{
        Utility.showLoading()
        textString = ""
        if (searchTxtField.text?.count)! >= 1 {
            var textString  = searchTxtField.text
            filterdOrNot = true
            var str : PLTM = PLTM()
            arrForSearchPlayer.removeAllObjects()
            for i in self.arrForPLTM {
                str = i as! PLTM
                let range = str.name?.lowercased()
                textString = textString!.lowercased()
                if range!.hasPrefix(textString!) == true{
                    arrForSearchPlayer.add(i)
                    filterdOrNot = true
                     print(arrForSearchPlayer.count)
                    tableview.reloadData()
                }else{
                     print(arrForSearchPlayer.count)
                    filterdOrNot = true
                    tableview.reloadData()
                }
            }
            Utility.hideLoading()
            return true
            
        }else {
            filterdOrNot = false
            tableview.reloadData()
            return true
        }
        print(arrForSearchPlayer.count)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
     super.viewWillDisappear(true)
        searchTxtField.text = ""
        
    }
    
    
    
    @IBAction func onClickChooseBtn(_ sender: Any) {
        if isTogglePickerView == false {
            isTogglePickerView = true
            viewForPIcker.isHidden = true
  
        }else{
            viewForPIcker.isHidden = false
            isTogglePickerView = false
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 77/255, green: 11/255, blue: 140/255, alpha: 1.0)
        setup()

        dataFecthonQuery()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if filterdOrNot == true
        {
            if arrForSearchPlayer == nil {
                return 0
            }else{
                return arrForSearchPlayer.count
            }
        }else{
            if arrForPLTM == nil {
                return 0
            }else{
                return arrForPLTM.count
            }
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let playerCellObj : playerCell = tableView.dequeueReusableCell(withIdentifier: "playerCell") as! playerCell
        
        playerCellObj.playerView.layer.borderWidth = 1.0
        playerCellObj.playerView.layer.cornerRadius = 15.0
        playerCellObj.playerImgView.clipsToBounds = true
        playerCellObj.playerImgView.layer.cornerRadius = 5
        
        if filterdOrNot == true {
            let pltmObj : PLTM = self.arrForSearchPlayer[indexPath.row] as! PLTM
            playerCellObj.lblTeamName.text = pltmObj.name!
            playerCellObj.lblPlayerName.text = pltmObj.team_name!
            
            let mainUrl : String = "\(Webservice.LOGO_MEDIUM_URL)" + "\(pltmObj.id_team!)" + "/" + "\(pltmObj.logo_small!)"
            print(mainUrl)
            
            if let url = URL(string: mainUrl) {
                Utility.showLoading()
                print("Download Started")
                getDataFromUrl(url: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    
                    print("Download Finished")
                    DispatchQueue.main.async() {
                        if pltmObj.id_team! == "2989" {
                            playerCellObj.playerImgView.image = UIImage.init(named: "asset-no-image")
                            Utility.hideLoading()
                        }else{
                            playerCellObj.playerImgView.image = UIImage(data: data)
                            Utility.hideLoading()
                        }
                    }
                }
            }
        }else{
            let pltmObj : PLTM = self.arrForPLTM[indexPath.row] as! PLTM
            playerCellObj.lblTeamName.text = pltmObj.name!
            playerCellObj.lblPlayerName.text = pltmObj.team_name!
            
            let mainUrl : String = "\(Webservice.LOGO_MEDIUM_URL)" + "\(pltmObj.id_team!)" + "/" + "\(pltmObj.logo_small!)"
            print(mainUrl)
            
            if let url = URL(string: mainUrl) {
                Utility.showLoading()
                print("Download Started")
                getDataFromUrl(url: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    
                    print("Download Finished")
                    DispatchQueue.main.async() {
                        if pltmObj.id_team! == "2989" {
                            playerCellObj.playerImgView.image = UIImage.init(named: "asset-no-image")
                            Utility.hideLoading()
                        }else{
                            playerCellObj.playerImgView.image = UIImage(data: data)
                            Utility.hideLoading()
                        }
                    }
                }
            }
        }
  /*       let playerObj : Players = self.arrForPlayer[indexPath.row] as! Players

        playerCellObj.lblTeamName.text = playerObj.name!
        print(self.arrForPlayer.count)
        
        for i in 0..<self.arrForTeam.count {
            var teammObj : Team = self.arrForTeam.object(at: i) as! Team
            if playerObj.id_team! == teammObj.id!/*(((arrForTeam.object(at: i)) as AnyObject).value(forKey: "id")as! String)*/ {
                let mainUrl : String = "\(Webservice.LOGO_SMALL_URL)" + "\(teammObj.id!)" + "/" + "\(teammObj.logo_small!)"
                print(mainUrl)
                if let url = URL(string: mainUrl) {
                    print("Download Started")
                    getDataFromUrl(url: url) { data, response, error in
                         guard let data = data, error == nil else { return }
                        print(response?.suggestedFilename ?? url.lastPathComponent)
                        print("Download Finished")
                        DispatchQueue.main.async() {
                            playerCellObj.playerImgView.image = UIImage(data: data)
                        }
                    }
                }            }
           





        }
*/
        return playerCellObj
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    /*    var teammObj:PLTM = self.arrForPLTM[indexPath.row]as! PLTM
        
        let playerDetailObj : PlyerDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "playerDetail") as! PlyerDetailVC
        playerDetailObj.strTeamId = teammObj.id_team
        playerDetailObj.strteamName = teammObj.team_name
        playerDetailObj.strplayerName = teammObj.name
       playerDetailObj.stridValueLbl = teammObj.id
        playerDetailObj.strimg = teammObj.logo_small!
        self.navigationController?.pushViewController(playerDetailObj, animated: true)
  */  }
    
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if jsonObj == nil {
            return 0
        }else{
                        return jsonObj!.teams!.count
        }

    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return jsonObj.teams![row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chooseTeamBtn.setTitle(jsonObj.teams![row].name, for: .normal)
       idStr = jsonObj.teams![row].id!
        
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
        
                Parser.parsePlayer(self.jsonObj, toArray: self.arrForPlayer, completion: { (result) in
                    print(self.arrForPlayer)
                })
                
                Parser.parseTeam(self.jsonObj, toArray: self.arrForTeam, completion: { (result) in
                    print(self.arrForTeam)
                    Utility.hideLoading()
                    
                })
                for i in 0..<self.arrForTeam.count {
                    
                        var tmObj : Team = self.arrForTeam.object(at: i) as! Team
                        var playerTeamObj : PlayerTeam = PlayerTeam.init(fromDictionary: [:]);
                  

                    for j in 0..<self.arrForPlayer.count {
                        
                        var plObj : Players = self.arrForPlayer.object(at: j) as! Players
                        
                        if plObj.id_team == tmObj.id {
                            
                            
                            let pltmObj:PLTM = PLTM.init(fromDictionary: [:]);
                                                        pltmObj.id = plObj.id
                                                        pltmObj.name = plObj.name
                                                        pltmObj.id_team = plObj.id_team
                                                        pltmObj.logo_small = tmObj.logo_small
                            pltmObj.team_name = tmObj.name
                                                        self.arrForPLTM.add(pltmObj)
                            
                            
                      
                        
                        }
                       
                    }
               
                   
                    
//                    
//                    print(self.arrForPLTM.count)
//                    for k in 0..<self.arrForPLTM.count {
//                        playerTeamObj.id = tmObj.id
//                        playerTeamObj.name = tmObj.name
//                        playerTeamObj.logo_small = tmObj.logo_small
//                        
//                        playerTeamObj.pltm.append(self.arrForPLTM.object(at: i) as! PLTM)
//                        self.arrForPlayerTeam.add(playerTeamObj)
//                    }
                }
               
                //                for i in 0..<self.arrForPlayer.count {
//                    var plObj : Players = self.arrForPlayer.object(at: i) as! Players
//                    for j in 0..<self.arrForTeam.count {
//                        var tmObj : Team = self.arrForTeam.object(at: j) as! Team
//
//                        if plObj.id_team == tmObj.id {
//
//                            let playerTeamObj : PlayerTeam = PlayerTeam.init(fromDictionary: [:]);
//
//
//                            let pltmObj:PLTM = PLTM.init(fromDictionary: [:]);
//                            pltmObj.id = plObj.id
//                            pltmObj.name = plObj.name
//                            pltmObj.id_team = plObj.id_team
//                            pltmObj.logo_small = tmObj.logo_small
//                            self.arrForPLTM.add(pltmObj)
//
//                            playerTeamObj.id = tmObj.id
//                            playerTeamObj.name = tmObj.name
//                            playerTeamObj.pltm.append(pltmObj)
//                           self.arrForPlayerTeam.add(playerTeamObj)
//
//                        }
//                    }
//                }
               
                print(self.arrForPlayerTeam)
                
                 self.tableview.reloadData()
            self.pickerView.reloadAllComponents()
        }
        }
    
    @IBAction func onClickBtnOk(_ sender: Any) {
        
        for i in 0..<arrForPLTM.count {
            var arrobj : PLTM = arrForPLTM[i] as! PLTM
            if idStr == arrobj.id_team{
                
            }
            
        }
        self.viewForPIcker.isHidden = true
        
    
    }
    @IBAction func onClickBtnCancel(_ sender: Any) {
        self.viewForPIcker.isHidden = true

    }
    
    
}
/*now what i need to do...*/

