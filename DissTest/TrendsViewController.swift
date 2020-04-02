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
        barCharts.layer.shadowRadius = 2
        barCharts.layer.shadowOpacity = 2
        barCharts.layer.cornerRadius = 7
        barCharts.layer.masksToBounds = true
        calendarBtn.layer.cornerRadius = 7
        calendarBtn.layer.masksToBounds = true
        adviceBtn.layer.cornerRadius = 7
        adviceBtn.layer.masksToBounds = true
        calendarBtn.layer.shadowOffset = .zero
         //calendarBtn.layer.shadowColor = UIColor.black.cgColor
                calendarBtn.layer.shadowRadius = 3
                calendarBtn.layer.shadowOpacity = 3
                calendarBtn.layer.shadowOffset = .zero

         adviceBtn.layer.shadowColor = UIColor.black.cgColor
                adviceBtn.layer.shadowRadius = 3
                adviceBtn.layer.shadowOpacity = 3
                adviceBtn.layer.shadowOffset = .zero
        
        trendsView.layer.backgroundColor = UIColor.systemGray6.cgColor
        trendsView.layer.cornerRadius = 7
        trendsView.layer.masksToBounds = true
        
        
        
        //
        //
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.navigationBar.tintColor = .blue
//        self.navigationController?.navigationBar.topItem?.title = "Trends"

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var ChartsView: UIView!
    @IBOutlet weak var trendsView: UIView!
    @IBOutlet weak var adviceBtn: UIButton!
    @IBOutlet weak var barCharts: UIButton!
    
    @IBOutlet weak var calendarBtn: UIButton!
    //    @IBOutlet weak var barCharts: UIView!
//    
//    @IBOutlet weak var calendar: UIView!
//    
//    @IBOutlet weak var advice: UIView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
