//
//  ConfirmTableViewCell.swift
//  Higher
//
//  Created by Devin Fan on 12/13/18.
//  Copyright © 2018 Devin Fan. All rights reserved.
//

import UIKit

class ConfirmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var applicantTwoCheck: UIImageView!
    @IBOutlet weak var applicantOneCheck: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
