//
//  MoodEntryViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 13/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class MoodEntryViewController: UIViewController {
    
   
     var dailyEntry: Mood = Mood(Date: "", Sleep: 0, Water: 0, Stress: 0, Exercise: 0, Location: "", Alcohol: 0, Mood: 0, Productivity: 0, Notes: "")
    var valueForMood = 0
    var valueForStress = 0
    var valueForProductivity = 0
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
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

        //productiveLbl.adjustsFontSizeToFitWidth = true





        // Do any additional setup after loading the view.
    }
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
    @IBAction func advanceBtn(_ sender: Any) {
    }
    
   
    @IBOutlet weak var moodLbl: UILabel!
    
    
    @IBOutlet weak var moodView: UIView!
    
    @IBOutlet weak var stressView: UIView!
    
    @IBOutlet weak var productiveView: UIView!
    @IBAction func moodLevel(_ sender: UISlider) {
        let step: Float = 1
        let roundedValue = round(sender.value / step) * step
        
        sender.value = roundedValue
        let result = Int(roundedValue)
        dailyEntry.Mood = result
        valueForMood = result
    }
    
   
    @IBAction func stressLevel(_ sender: UISlider) {
        let step: Float = 1
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        let result = Int(roundedValue)
        dailyEntry.Stress = result
        valueForStress = result
    }
    
    @IBAction func productivityLevels(_ sender: UISlider) {
        let step: Float = 1
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        let result = Int(roundedValue)
        dailyEntry.Productivity = result
        valueForProductivity = result
    }
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "moodSegue" {
//
//            let lifestyleVC = segue.destination as!
//
//        }
//    }
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moodSegue"{
            
            let lifestyleVC = segue.destination as! LifestyleEntryViewController
           // lifestyleVC.dailyEntr
            lifestyleVC.valueForMood = valueForMood
            lifestyleVC.valueForStress = valueForStress
            lifestyleVC.valueForProductivity = valueForProductivity
        }
        
        
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
