//
//  helpTableViewCell.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 10/05/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class helpTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //Label to display the text
        textLbl.adjustsFontSizeToFitWidth = true
    }

    @IBOutlet weak var textLbl: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
