//
//  MoodEntryViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 13/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  Class that allows the mood values to be inputted
//

import UIKit

class MoodEntryViewController: UIViewController {
    
   //Daily entry object created
     var dailyEntry: Mood = Mood(Date: "", Sleep: 0, Water: 0, Stress: 0, Exercise: 0, Location: "", Alcohol: 0, Mood: 0, Productivity: 0, Notes: "",SleepMinutes: 0, ExerciseMinutes: 0)
    //Lowest values the users can input and also the default
    var valueForMood = 1
    var valueForStress = 1
    var valueForProductivity = 1
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Formats the views
        moodView.layer.cornerRadius = 7
        moodView.layer.masksToBounds = true
        moodView.layer.backgroundColor = UIColor.systemGray6.cgColor
        stressView.layer.cornerRadius = 7
        stressView.layer.masksToBounds = true
        stressView.layer.backgroundColor = UIColor.systemGray6.cgColor
        productiveView.layer.cornerRadius = 7
        productiveView.layer.masksToBounds = true
        productiveView.layer.backgroundColor = UIColor.systemGray6.cgColor
        advanceBtn.layer.cornerRadius = 7
        advanceBtn.layer.masksToBounds = true
        advanceBtn.layer.backgroundColor = UIColor.systemIndigo.cgColor
        moodLbl.adjustsFontSizeToFitWidth = true
        stressLbl.adjustsFontSizeToFitWidth = true
        productiveLbl.adjustsFontSizeToFitWidth = true
        excellentLbl.adjustsFontSizeToFitWidth = true
        neutralLbl.adjustsFontSizeToFitWidth = true
        veryBadLbl.adjustsFontSizeToFitWidth = true
        veryLbl.adjustsFontSizeToFitWidth = true
        somewhatLbl.adjustsFontSizeToFitWidth = true
        notAtAllLbl.adjustsFontSizeToFitWidth = true
        pNotAtLbl.adjustsFontSizeToFitWidth = true
        moderatlyLbl.adjustsFontSizeToFitWidth = true
        veryLbl.adjustsFontSizeToFitWidth = true
        informationView.isHidden = true
        informationView.layer.cornerRadius = 7
        informationView.layer.masksToBounds = true
        informationView.layer.shadowRadius = 2.5
        informationView.layer.shadowColor = UIColor.systemGray.cgColor
        informationView.layer.backgroundColor = UIColor.systemGray6.cgColor
        closeBtn.layer.cornerRadius = 7
        closeBtn.layer.masksToBounds = true


        
    }
    //IBOutlets
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var informationView: UIView!
    @IBOutlet weak var pNotAtLbl: UILabel!
    @IBOutlet weak var moderatlyLbl: UILabel!
    @IBOutlet weak var veryGoodLbl: UILabel!
    @IBOutlet weak var notAtAllLbl: UILabel!
    @IBOutlet weak var somewhatLbl: UILabel!
    @IBOutlet weak var veryLbl: UILabel!
    @IBOutlet weak var neutralLbl: UILabel!
    @IBOutlet weak var veryBadLbl: UILabel!
    @IBOutlet weak var excellentLbl: UILabel!
    @IBOutlet weak var productiveLbl: UILabel!
    @IBOutlet weak var stressLbl: UILabel!
    @IBOutlet weak var advanceBtn: UIButton!
    @IBOutlet weak var moodLbl: UILabel!
    @IBOutlet weak var moodView: UIView!
    @IBOutlet weak var stressView: UIView!
    @IBOutlet weak var productiveView: UIView!

    
    
    //View that appears when the information button is pressed
    @IBAction func informationBtn(_ sender: Any) {
        
        informationView.alpha = 0
        moodView.alpha = 1
        stressView.alpha = 1
        productiveView.alpha = 1
        advanceBtn.alpha = 1
        //View appears using animation
        UIView.animate(withDuration: 1.5, animations: {
            self.moodView.alpha = 0
            self.stressView.alpha = 0
            self.productiveView.alpha = 0
            self.moodView.isHidden = true
            self.stressView.isHidden = true
            self.productiveView.isHidden = true
            self.informationView.alpha = 1
            self.informationView.isHidden = false
            self.advanceBtn.alpha = 0
            self.advanceBtn.isHidden = true
        })
    }
    
    
    // Button to close the information view
    @IBAction func closeViewBtn(_ sender: Any) {
        informationView.alpha = 1
        moodView.alpha = 0
        stressView.alpha = 0
        productiveView.alpha = 0
        advanceBtn.alpha = 0
        UIView.animate(withDuration: 1.5, animations: {
            self.informationView.alpha = 0
            self.moodView.alpha = 1
            self.stressView.alpha = 1
            self.productiveView.alpha = 1
            self.informationView.isHidden = true
            self.moodView.isHidden = false
            self.stressView.isHidden = false
            self.productiveView.isHidden = false
            self.advanceBtn.alpha = 1
            self.advanceBtn.isHidden = false
        })
    
    }
    
   
    @IBAction func advanceBtn(_ sender: Any) {
    }
    
   //Slider that changes the mood value
        @IBAction func moodLevel(_ sender: UISlider) {
        let step: Float = 1
        let roundedValue = round(sender.value / step) * step
        
        sender.value = roundedValue
        let result = Int(roundedValue)
        dailyEntry.Mood = result
        valueForMood = result
    }
    
   //Slider that changes the stress value
    @IBAction func stressLevel(_ sender: UISlider) {
        let step: Float = 1
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        let result = Int(roundedValue)
        dailyEntry.Stress = result
        valueForStress = result
    }
    
    //Slider that changes the productivity value
    @IBAction func productivityLevels(_ sender: UISlider) {
        let step: Float = 1
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        let result = Int(roundedValue)
        dailyEntry.Productivity = result
        valueForProductivity = result
    }
    
    
    

    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    //function that passes the values into the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moodSegue"{
            let lifestyleVC = segue.destination as! LifestyleEntryViewController
            lifestyleVC.valueForMood = valueForMood
            lifestyleVC.valueForStress = valueForStress
            lifestyleVC.valueForProductivity = valueForProductivity
        }
        
        
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
