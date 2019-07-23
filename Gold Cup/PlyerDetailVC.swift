//
//  PlyerDetailVC.swift
//  Gold Cup
//
//  Created by PRASHANT MAHETA on 28/06/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import UIKit

class PlyerDetailVC: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var teamNamelbl: UILabel!
    @IBOutlet weak var playerNameLbl: UILabel!
    @IBOutlet weak var idValueLbl: UILabel!
    
    var strimg : String? = ""
    var strteamName : String? = ""
    var strplayerName : String? = ""
    var stridValueLbl : String = ""
    var strTeamId : String? = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    setUp()
    }
    
    func setUp(){
        idValueLbl.text = stridValueLbl
        playerNameLbl.text = strplayerName!
        teamNamelbl.text = strteamName!
        
        
        let mainUrl : String = "\(Webservice.LOGO_MEDIUM_URL)" + "\(strTeamId!)" + "/" + "\(strimg!)"
        print(mainUrl)
        if let url = URL(string: mainUrl) {
            print("Download Started")
            getDataFromUrl(url: url) { data, response, error in
                guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? url.lastPathComponent)
                print("Download Finished")
                DispatchQueue.main.async() {
                    self.imgView.image = UIImage(data: data)
                }
            }
            
        }    }
    
    @IBAction func onClickBackBtn(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }

    @IBAction func onclickBackBtn(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    

}
