//
//  ViewController.swift
//  Gold Cup
//
//  Created by PRASHANT MAHETA on 24/06/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var menuName : [String] = ["Teams","Matches","Players"]
    var menuLogo : [String] = ["asset-team","asset-matches","asset-player"]
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    var strLbl: String!
    @IBOutlet weak var lblTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func setup(){
        lblTitle.text = "Premier Division" + "\(strLbl!)"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setup()
    }
    @IBAction func onClickBackBtn(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuName.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let menuCell : mainCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! mainCell
        menuCell.cellView.layer.masksToBounds = true
        menuCell.setShadow()
    
        menuCell.cellLbl.text = menuName[indexPath.row]
        menuCell.cellImgView.image = UIImage.init(named: menuLogo[indexPath.row])
        
        return menuCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            let teamsvcObj : TeamVC = self.storyboard?.instantiateViewController(withIdentifier: "teamvc") as! TeamVC
            self.navigationController?.pushViewController(teamsvcObj, animated: true)
            
        }else if indexPath.row == 1{
            
            let matchesvcObj : MatchesVC = self.storyboard?.instantiateViewController(withIdentifier: "matchesvc") as! MatchesVC
            self.navigationController?.pushViewController(matchesvcObj, animated: true)
            
        }else if indexPath.row == 2 {
            
            let playervcObj : PlayerVC = self.storyboard?.instantiateViewController(withIdentifier: "playervc") as! PlayerVC
            self.navigationController?.pushViewController(playervcObj, animated: true)
            
        }else if indexPath.row == 3{
            
        }else{
         
        }
    }
    
}

