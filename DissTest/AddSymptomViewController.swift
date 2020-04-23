//
//  AddSymptomViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 23/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class AddSymptomViewController: UIViewController {
    var valueForName = ""
    var valueForDescription = "No Description"
    var valueForDrug = "No Drugs"
    let date = Date()
    let dateFormatter = DateFormatter()
    var dateString = ""
    var database = LogsViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd-MM-yyyy"
               dateString = dateFormatter.string(from:date)
        popUpView.isHidden = true
        popUpView.layer.backgroundColor = UIColor.systemGray6.cgColor
        popUpView.layer.cornerRadius = 7
        popUpView.layer.masksToBounds = true
        backgroundView.layer.cornerRadius = 7
        backgroundView.layer.masksToBounds = true
        informationView.isHidden = true
        informationView.layer.backgroundColor = UIColor.systemGray6.cgColor
        informationView.layer.cornerRadius = 7
        informationView.layer.masksToBounds = true
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var informationView: UIView!
    
    @IBAction func informationBtn(_ sender: Any) {
        backgroundView.alpha = 1
        informationView.alpha = 0
        if popUpView.isHidden == false {
            popUpView.alpha = 1
        } else {
            popUpView.alpha = 0
        }
        UIView.animate(withDuration: 1.5, animations: {
            self.backgroundView.alpha = 0
            self.backgroundView.isHidden = true
            if self.popUpView.isHidden == false {
                self.popUpView.alpha = 0
                self.popUpView.isHidden = true
            }
            self.informationView.alpha = 1
            self.informationView.isHidden = false
        })
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        backgroundView.alpha = 0
        informationView.alpha = 1
        UIView.animate(withDuration: 1.5, animations: {
            self.backgroundView.alpha = 1
            self.backgroundView.isHidden = false
            self.informationView.alpha = 0
            
            self.informationView.isHidden = true
            
        })
        
    }
    
    
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBAction func drugTxt(_ sender: Any) {
        var text: String = drugTxt.text!
        valueForDrug = text
    }
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBAction func descriptionTxt(_ sender: Any) {
        var text: String = descriptionTxt.text!
        valueForDescription = text
    }
    
    @IBAction func nameTxt(_ sender: Any) {
        var text: String = nameTxt.text!
        valueForName = text
    }
    
    @IBOutlet weak var drugTxt: UITextField!
    
    @IBOutlet weak var descriptionTxt: UITextField!
    
    @IBOutlet weak var popUpTxt: UILabel!
    
    @IBAction func saveBtn(_ sender: Any) {
        
        self.popUpView.isHidden = false
        self.popUpView.alpha = 1
        
        if valueForName == "" {
            popUpTxt.text = "Please enter a name of your symptom."
        } else {
        
        
        var sym = Symptom(Date: dateString, Name: valueForName, Description: valueForDescription, Drugs: valueForDrug)
        database.databaseStore.addNewSymptom(symptom: sym)
            popUpTxt.text = "\(valueForName) added to todays symptoms."
    }
    }
    
    
    @IBOutlet weak var popUpView: UIView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
