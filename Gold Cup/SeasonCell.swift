//
//  SeasonCell.swift
//  Gold Cup
//
//  Created by Janki on 16/07/19.
//  Copyright © 2019 infotech IT Solution. All rights reserved.
//

import UIKit

class SeasonCell: UITableViewCell {

    @IBOutlet weak var lblyear: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
