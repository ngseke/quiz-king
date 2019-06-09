//
//  DifficultTableViewCell.swift
//  QuizKing
//
//  Created by SmallMO on 2019/6/9.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class DifficultTableViewCell: UITableViewCell {
    
    @IBOutlet var difficultLable: UILabel!
    @IBOutlet var moneyLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
