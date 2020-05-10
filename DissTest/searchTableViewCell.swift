//
//  searchTableViewCell.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 01/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class searchTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //Labels to display the text

    @IBOutlet weak var productivityValue: UILabel!
    @IBOutlet weak var stressValue: UILabel!
    @IBOutlet weak var moodValue: UILabel!
    
    @IBOutlet weak var dateValue: UILabel!
    
    
}
