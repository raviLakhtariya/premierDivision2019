//
//  playerCell.swift
//  Gold Cup
//
//  Created by Janki on 25/06/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import UIKit

class playerCell: UITableViewCell {

    @IBOutlet weak var lblPlayerName: UILabel!
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var playerImgView: UIImageView!
    @IBOutlet weak var lblTeamName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
