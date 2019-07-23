//
//  ScoreCell.swift
//  Gold Cup
//
//  Created by PRASHANT MAHETA on 01/07/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import UIKit

class ScoreCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var id_team: UILabel!
    @IBOutlet weak var penaltyShot: UILabel!
    @IBOutlet weak var ownGoal: UILabel!
    @IBOutlet weak var minute: UILabel!
    @IBOutlet weak var id_jucater: UILabel!
    @IBOutlet weak var mainStackView: UIStackView!
    
    @IBOutlet weak var ownGoalView: UIView!
    @IBOutlet weak var awayGoalVIew: UIView!
    
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var awayGoalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
