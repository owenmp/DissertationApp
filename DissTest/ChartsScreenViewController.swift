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
        
        pieChartBtn.layer.cornerRadius = 7
        pieChartBtn.layer.masksToBounds = true
        pieChartBtn.layer.borderWidth = 0.25
        pieChartBtn.layer.borderColor = UIColor.black.cgColor
        
        lineChartBtn.layer.cornerRadius = 7
        lineChartBtn.layer.masksToBounds = true
        lineChartBtn.layer.borderWidth = 0.25
        lineChartBtn.layer.borderColor = UIColor.black.cgColor
        barChartBtn.layer.cornerRadius = 7
        barChartBtn.layer.masksToBounds = true
        barChartBtn.layer.borderWidth = 0.25
        barChartBtn.layer.borderColor = UIColor.black.cgColor
        

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var optionsView: UIView!
    
    @IBOutlet weak var pieChartBtn: UIButton!
    @IBOutlet weak var lineChartBtn: UIButton!
    @IBOutlet weak var titleView: UIView!
    
    @IBOutlet weak var barChartBtn: UIButton!
    
    @IBAction func barChartBtn(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
