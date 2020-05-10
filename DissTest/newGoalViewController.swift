//
//  newGoalViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 18/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  Creates goal for that day

import UIKit

class newGoalViewController: UIViewController {
    var valueForName = ""
    var valueForDescription = ""
    let date = Date()
    let dateFormatter = DateFormatter()
    var dateString = ""
    var database = LogsViewController()
    var nextVC = todaysPlanTableViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateString = dateFormatter.string(from:date)
        
        backGroundView.layer.cornerRadius = 7
        backGroundView.layer.backgroundColor = UIColor.systemGray6.cgColor
        backGroundView.layer.masksToBounds = true
        saveBtn.layer.cornerRadius = 7
        saveBtn.layer.masksToBounds = true
        saveBtn.layer.backgroundColor = UIColor.systemIndigo.cgColor
        statusView.layer.cornerRadius = 7
        statusView.layer.masksToBounds = true
        statusView.layer.backgroundColor = UIColor.systemGray6.cgColor
        statusView.isHidden = true
        descriptionTxt.layer.backgroundColor = UIColor.white.cgColor
        descriptionTxt.layer.borderColor = UIColor.systemGray6.cgColor

        // Do any additional setup after loading the view.
    }
    
    
//    @IBAction func nameTxt(_ sender: Any) {
//        var text: String = nameTxt.text!
//        valueForName = text
//    }
//
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var nameTxt: UITextField!
//
    @IBOutlet weak var statusView: UIView!
    //
   @IBOutlet weak var descriptionTxt: UITextField!
//    @IBAction func descriptionTxt(_ sender: Any) {
//        var text: String = descriptionTxt.text!
//        valueForDescription = text
//    }
    
    @IBAction func descriptionTxt(_ sender: Any) {
          var text: String = descriptionTxt.text!
        valueForDescription = text
        
    }
    
    @IBAction func nameTxt(_ sender: Any) {
         var text: String = nameTxt.text!
            valueForName = text
    }
    
    
    
    
    
   
    //saves goal to the database
       @IBOutlet weak var saveBtn: UIButton!
    @IBAction func saveBtn(_ sender: Any) {
        
        if valueForName == "" {
            statusView.isHidden = false
            statusLbl.text = "Enter a name"
            statusLbl.textColor = UIColor.systemRed        }
        else if valueForDescription == "" {
            statusView.isHidden = false
            statusLbl.text = "Enter a description"
            statusLbl.textColor = UIColor.systemRed
        } else {
        statusLbl.text = "\(valueForName) added to todays goals."
            statusLbl.textColor = UIColor.black
        statusView.isHidden = false
        var dailyPlan = ActivityPlan(date: dateString, name: valueForName, description: valueForDescription, completed: 0)
        database.databaseStore.addNewGoal(goal: dailyPlan)
        if let presenter = presentingViewController as? todaysPlanTableViewController {
            presenter.plan.removeAll()
            presenter.plan = presenter.database.databaseStore.getPlan(date: dateString)
            presenter.tableView.reloadData()
            presenter.viewDidLoad()
                    }
        }
    }
    
    
 
    
    @IBOutlet weak var backGroundView: UIView!
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
