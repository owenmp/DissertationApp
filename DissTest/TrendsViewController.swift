//
//  TrendsViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 17/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class TrendsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        barCharts.layer.shadowColor = UIColor.black.cgColor
        barCharts.layer.shadowRadius = 2
        barCharts.layer.shadowOpacity = 2
        calendar.layer.shadowOffset = .zero
         calendar.layer.shadowColor = UIColor.black.cgColor
                calendar.layer.shadowRadius = 3
                calendar.layer.shadowOpacity = 3
                calendar.layer.shadowOffset = .zero
        
         advice.layer.shadowColor = UIColor.black.cgColor
                advice.layer.shadowRadius = 3
                advice.layer.shadowOpacity = 3
                advice.layer.shadowOffset = .zero
        
        
        
        //
        //
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.navigationBar.tintColor = .blue
//        self.navigationController?.navigationBar.topItem?.title = "Trends"

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var barCharts: UIView!
    
    @IBOutlet weak var calendar: UIView!
    
    @IBOutlet weak var advice: UIView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
