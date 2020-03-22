//
//  ActivityPlanViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 17/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class ActivityPlanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        activityPlanView.layer.shadowColor = UIColor.black.cgColor
        activityPlanView.layer.shadowRadius = 2
        activityPlanView.layer.shadowOpacity = 2
        activityPlanView.layer.shadowOffset = .zero
        
        currentPlanView.layer.shadowColor = UIColor.black.cgColor
        currentPlanView.layer.shadowRadius = 2
        currentPlanView.layer.shadowOpacity = 2
        currentPlanView.layer.shadowOffset = .zero
       
        
    }
    
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
