//
//  SeasonVC.swift
//  Gold Cup
//
//  Created by Janki on 16/07/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import UIKit
import Alamofire
class SeasonVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var txtSeasonId: UITextField!
    var arrForSeason : NSMutableArray = NSMutableArray.init()
    var jsonObj : Base!
    
    @IBOutlet weak var btnGo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
fetchData()
        self.initialSetup()
        // Do any additional setup after loading the view.
    }
    func initialSetup(){
     
        tableview.clipsToBounds = true
        tableview.layer.cornerRadius = 30.0
        
        tableview.setShadow()
        tableview.layer.shadowColor = UIColor.gray.cgColor
        
         tableview.layer.shadowOffset = CGSize(width: 0.0, height: 0.0);
         tableview.layer.shadowOpacity = 0.7;
         tableview.layer.shadowRadius = 5.0;
         tableview.layer.masksToBounds = true;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if jsonObj == nil {
            return 0
        }else{
             return jsonObj!.seasons!.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        
        let seasonCelobj : SeasonCell = self.tableview.dequeueReusableCell(withIdentifier: "seasoncell") as! SeasonCell
        seasonCelobj.contentView.clipsToBounds = true
        seasonCelobj.contentView.layer.cornerRadius = 30.0
        seasonCelobj.contentView.layer.masksToBounds = true
     //   seasonCelobj.lblName.text = jsonObj.name!
        seasonCelobj.lblyear.text = jsonObj.seasons![(jsonObj!.seasons!.count - 1) - indexPath.row].league_name!
    
        return seasonCelobj
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        preferenceHelper.setSeasonId(jsonObj.seasons![(jsonObj!.seasons!.count - 1) - indexPath.row].id!)
       
        let vcObj : ViewController = self.storyboard?.instantiateViewController(withIdentifier: "vc") as! ViewController
        vcObj.strLbl = jsonObj.seasons![(jsonObj!.seasons!.count - 1) - indexPath.row].league_name!
        self.navigationController?.pushViewController(vcObj, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if jsonObj == nil {
            return "Airtricity League"
        }else{
            return "\(jsonObj!.name!)"
        }

    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    /*func tableView(tableView: UITableView, ViewForHeaderInSection section: Int) -> UIView? {
        let tableheaderView : UITableViewHeaderFooterView = UITableViewHeaderFooterView.init()
        tableheaderView.backgroundColor = UIColor.blue
        tableheaderView.textLabel?.textAlignment = .center
        if jsonObj == nil {
            tableheaderView.textLabel!.text = jsonObj!.name!

        }
        else{
            tableheaderView.textLabel!.text = "Airtricity League"
        }
        return tableheaderView
    }
    */
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
      header.clipsToBounds = true
        header.layer.masksToBounds = true
        //;'  header.layer.cornerRadius = 30.0
        
        header.textLabel?.textAlignment = NSTextAlignment.center
    }
    func fetchData(){
       Utility.showLoading()
        
        let urlString = Webservice.BASE_URL_LEAGUE
        
        var url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        print(url!)
        var  dictParam : [String : Any] = [:]
        dictParam[PARAMS.id_league] = "59"
   
        Alamofire.request(url!, method: .post, parameters: dictParam, encoding: JSONEncoding.default, headers: nil).responseJSON
            { (response:DataResponse<Any>) in
                let jsonDecoder = JSONDecoder()
                self.jsonObj = try? jsonDecoder.decode(Base.self, from: response.data!)
                print(self.jsonObj)
                self.tableview.reloadData()
                Utility.hideLoading()
        }
    }
    
}
