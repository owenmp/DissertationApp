//
//  ActivityPlanViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 17/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  Gives the user option to start new plan or view previous

import UIKit

class ActivityPlanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currentPlanView.layer.backgroundColor = UIColor.systemGray6.cgColor
        currentPlanView.layer.cornerRadius = 7
        currentPlanView.layer.masksToBounds = true
       
        activityPlanView.layer.backgroundColor = UIColor.systemGray6.cgColor
        activityPlanView.layer.cornerRadius = 7
        activityPlanView.layer.masksToBounds = true
        
        viewPlansBtn.layer.backgroundColor = UIColor.systemIndigo.cgColor
        viewPlansBtn.layer.cornerRadius = 7
        viewPlansBtn.layer.masksToBounds = true
        todaysPlanBtn.layer.backgroundColor = UIColor.systemIndigo.cgColor
        todaysPlanBtn.layer.cornerRadius = 7
        todaysPlanBtn.layer.masksToBounds = true
        
    }
    
    @IBOutlet weak var todaysPlanBtn: UIButton!
    @IBAction func todaysPlanBtn(_ sender: Any) {
    }
    
    @IBOutlet weak var viewPlansBtn: UIButton!
    
    @IBOutlet weak var currentPlanView: UIView!
    
    @IBOutlet weak var activityPlanView: UIView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
