//
//  newGoalViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 18/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

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

        // Do any additional setup after loading the view.
    }
    
    
//    @IBAction func nameTxt(_ sender: Any) {
//        var text: String = nameTxt.text!
//        valueForName = text
//    }
//
   @IBOutlet weak var nameTxt: UITextField!
//
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
    
    
    
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
       @IBOutlet weak var saveBtn: UIButton!
    @IBAction func saveBtn(_ sender: Any) {
       // guard var name = nameTxt.text else{return}
       
       // guard var description = descriptionTxt.text else{return}
       // valueForName = name
        //valueForDescription = description
        
        var dailyPlan = ActivityPlan(date: dateString, name: valueForName, description: valueForDescription, completed: 0)
//        print(dailyPlan.name)
//        print(dailyPlan.description)
        database.databaseStore.addNewGoal(goal: dailyPlan)
        if let presenter = presentingViewController as? todaysPlanTableViewController {
            presenter.plan.removeAll()
            presenter.plan = presenter.database.databaseStore.getPlan(date: dateString)
            presenter.tableView.reloadData()
            presenter.viewDidLoad()
        }
        
        dismiss(animated: true, completion: nil)
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
