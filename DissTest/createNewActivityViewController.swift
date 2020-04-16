//
//  createNewActivityViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 15/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class createNewActivityViewController: UIViewController {
    var valueForName : String = ""
    var valueForDescription : String = "Des"
    var descriptionSend: String = "Hello"
    var database = LogsViewController()
    var nextVC = ActivitiesTableViewController()
    
    
   
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.layer.backgroundColor = UIColor.systemGray6.cgColor
        backgroundView.layer.cornerRadius = 7
        backgroundView.layer.masksToBounds = true
        finishBtn.layer.cornerRadius = 7
        finishBtn.layer.backgroundColor = UIColor.systemBlue.cgColor
        finishBtn.layer.masksToBounds = true

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var finishBtn: UIButton!
    
    @IBOutlet weak var backgroundView: UIView!
    
   
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBAction func nameTxt(_ sender: Any) {
        var text: String = nameTxt.text!
        valueForName = text
     
    }
    
    @IBOutlet weak var descriptionTxt: UITextField!
    @IBAction func descriptionTxt(_ sender: Any) {
        var description: String = descriptionTxt.text!
        valueForDescription = description
    }
    
    
    @IBAction func createBtn(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToVC1", sender: self)
        //navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func dismissVC(_ sender: Any) {
        if let presenter = presentingViewController as? ActivitiesTableViewController {
            print(valueForName)
            print(valueForDescription)
            print(descriptionTxt.text!)
           // presenter.valueForName = valueForName
            //presenter.valueForDescription = valueForDescription
            database.databaseStore.insertNewActivity(Name: valueForName, Description: descriptionTxt.text!)
         
            
            // nextVC.viewDidLoad()
            
           
            
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func finishBtn(_ sender: Any) {
        print(valueForName)
        var valueForDesc = descriptionTxt.text!
        print(valueForDesc)
database.databaseStore.insertNewActivity(Name: valueForName, Description: valueForDesc)
           
        if let presenter = presentingViewController as? ActivitiesTableViewController { presenter.activities.removeAll()
            presenter.activities = presenter.blabla.databaseStore.getActivities()
            presenter.tableView.reloadData()
            presenter.viewDidLoad()
    }
          dismiss(animated: true, completion: nil)
              
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
