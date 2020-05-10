//
//  EntryTableViewCell.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 24/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  Shows entries

import UIKit

class EntryTableViewCell: UITableViewCell {
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //IBOutlets
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var moodValueLbl: UILabel!
    
    @IBOutlet weak var stressValueLbl: UILabel!
    
    @IBOutlet weak var productivityValueLbl: UILabel!
    
}
