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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        print(dailyEntry.Mood)
        print(dailyEntry.Stress)
        print(dailyEntry.Productivity)
    }
    
    
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
