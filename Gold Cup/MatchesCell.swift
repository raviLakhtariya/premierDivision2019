//
//  MatchesCell.swift
//  Gold Cup
//
//  Created by Janki on 25/06/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import UIKit

class MatchesCell: UITableViewCell {

    @IBOutlet weak var mainVIew: UIView!
    @IBOutlet weak var matchesStackView: UIStackView!
    
    @IBOutlet weak var homeTeamImg: UIImageView!
    @IBOutlet weak var homeTeamName: UILabel!
    
    @IBOutlet weak var awayTeamImg: UIImageView!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var timeSchedule: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
