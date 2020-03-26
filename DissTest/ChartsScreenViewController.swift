//
//  ChartsScreenViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 26/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class ChartsScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        optionsView.layer.backgroundColor = UIColor.systemGray6.cgColor
        optionsView.layer.cornerRadius = 7
        optionsView.layer.masksToBounds = true
        titleView.layer.backgroundColor = UIColor.systemGray6.cgColor
        titleView.layer.cornerRadius = 7
        titleView.layer.masksToBounds = true
        

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var optionsView: UIView!
    
    @IBOutlet weak var titleView: UIView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
