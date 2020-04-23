//
//  SymptomTableViewCell.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 23/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class SymptomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var drugLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
