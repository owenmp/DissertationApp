//
//  AddSymptomViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 23/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  Class that adds symptoms to the database.

import UIKit

class AddSymptomViewController: UIViewController {
    //Initial values for symptom object
    var valueForName = ""
    var valueForDescription = "No Description"
    var valueForDrug = "No Drugs"
   
    //Date the symptom is being added
    let date = Date()
    let dateFormatter = DateFormatter()
    var dateString = ""
    
    //Database object
    var database = LogsViewController()
    

    //Runs when the screen is opened
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Formats todays date to dd-mm-yyyy
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateString = dateFormatter.string(from:date)
        
        //View that shows when a name isn't opened
        popUpView.isHidden = true
        popUpView.layer.backgroundColor = UIColor.systemGray6.cgColor
        popUpView.layer.cornerRadius = 7
        popUpView.layer.masksToBounds = true
        
        
        //Background view that all other views are on top of
        backgroundView.layer.cornerRadius = 7
        backgroundView.layer.masksToBounds = true
        
        //View that appears when information button is pressed
        informationView.isHidden = true
        informationView.layer.backgroundColor = UIColor.systemGray6.cgColor
        informationView.layer.cornerRadius = 7
        informationView.layer.masksToBounds = true
        infoLbl.text = "Symptoms can have an affect on your mood. Enter any physical or mental symptoms you have experienced today, along with any drugs you may have taken to treat it."
        
        
        //Button to add the symptom
        symptomBtn.layer.cornerRadius = 7
        symptomBtn.layer.masksToBounds = true
        symptomBtn.layer.backgroundColor = UIColor.systemIndigo.cgColor
        
       
       

    }
    
    //Outlets
    
    @IBOutlet weak var symptomBtn: UIButton!
    @IBOutlet weak var informationView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var drugTxt: UITextField!
    @IBOutlet weak var descriptionTxt: UITextField!
    @IBOutlet weak var popUpTxt: UILabel!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var popUpView: UIView!

    
    /**
            Button that brings ups information about adding symptoms
     */
    @IBAction func informationBtn(_ sender: Any) {
        
        backgroundView.alpha = 1
        informationView.alpha = 0
       //Only completes the animation if the view isn't already present
        if popUpView.isHidden == false {
            popUpView.alpha = 1
        } else {
            popUpView.alpha = 0
        }
        //Animates the view appearing
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
    
    //Button to close the information view and show the background view
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
    
    
    
    
    //Text field to change the value of the drug
    @IBAction func drugTxt(_ sender: Any) {
        var text: String = drugTxt.text!
        valueForDrug = text
    }
    
    //Text field to change value of the description
    @IBAction func descriptionTxt(_ sender: Any) {
        var text: String = descriptionTxt.text!
        valueForDescription = text
    }
    
    //Text field to change the value of the name
    @IBAction func nameTxt(_ sender: Any) {
        var text: String = nameTxt.text!
        valueForName = text
    }
    
    
    
    //Button that saves the symptom to the database
    @IBAction func saveBtn(_ sender: Any) {
        
        self.popUpView.isHidden = false
        self.popUpView.alpha = 1
        //Stops the user saving a symptom without a name
        if valueForName == "" {
            popUpTxt.text = "Please enter a name of your symptom."
        } else {
        
        //creates symptom object
        var todaysSymptom = Symptom(Date: dateString, Name: valueForName, Description: valueForDescription, Drugs: valueForDrug)
        
            //writes symptom oject to the database
        database.databaseStore.addNewSymptom(symptom: todaysSymptom)
            
            popUpTxt.text = "\(valueForName) added to todays symptoms."
            popUpTxt.textColor = UIColor.black
    }
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
