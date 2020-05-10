//
//  ActivitiesTableViewCell.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 17/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  Shows activity

import UIKit

class ActivitiesTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    

}
