//
//  LifestyleEntryViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 13/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class LifestyleEntryViewController: UIViewController {
    var valueForMood = 0
    var valueForStress = 0
    var valueForProductivity = 0
    var valueForSleep = 0
      var ValueForExercise = 0
      var valueForWater = 0
      var valueForAlcohol = 0
      var valueForLocation = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print(valueForMood)
        print(valueForStress)
        print(valueForProductivity)

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var sleepHoursTxt: UITextField!
    @IBAction func sleepHoursField(_ sender: Any) {
        var text: String = sleepHoursTxt.text!
       var value = Int(text)
        valueForSleep = value!
    }
    
    
    @IBOutlet weak var exerciseHouseTxt: UITextField!
    @IBAction func exerciseHoursTxt(_ sender: Any) {
        var text: String = exerciseHouseTxt.text!
        var value = Int(text)
        ValueForExercise = value!
    }
    
    @IBOutlet weak var waterTxt: UITextField!
    
    @IBAction func waterTxt(_ sender: Any) {
        var text: String = waterTxt.text!
        var value = Int(text)
        valueForWater = value!
    }
    
    
    @IBOutlet weak var alcoholTxt: UITextField!
    
    @IBAction func AlcoholTxt(_ sender: Any) {
        var text: String = alcoholTxt.text!
        var value = Int(text)
        valueForAlcohol = value!
    }
    
    
    @IBOutlet weak var locationTxt: UITextField!
    
    @IBAction func locationTxt(_ sender: Any) {
        var text:String = valueForLocation
        valueForLocation = text
    }
    
    
    
    
    
    @IBAction func nextBtn(_ sender: Any) {
        guard var tester = sleepHoursTxt.text else { return  }
       let valueForSlee = Int(tester) ?? 0
        ///////////////////
            
        guard var exercise = exerciseHouseTxt.text else {
            return
        }
        let valueForEx = Int(exercise) ?? 0
        
        //////////////////
        guard var water = waterTxt.text else{
            return}
        let valueForWate = Int(water) ?? 0
        ////////////////
        guard var alcohol = alcoholTxt.text else {
            return}
        let valueForAlc = Int(alcohol) ?? 0
        
        guard var location = locationTxt.text else { return}
        let valueForloc = location
            valueForLocation = valueForloc
        ////////////
        valueForAlcohol = valueForAlc
        valueForWater = valueForWate
        ValueForExercise = valueForEx
        valueForSleep = valueForSlee
        print(valueForSleep)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "lifestyleSegue" {
            let activitiesVC = segue.destination as! ActivitiesViewController
            activitiesVC.valueForSleep = valueForSleep
        activitiesVC.ValueForExercise = ValueForExercise
            activitiesVC.valueForWater = valueForWater
            activitiesVC.valueForAlcohol = valueForAlcohol
            activitiesVC.valueForLocation = valueForLocation
            activitiesVC.valueForMood = valueForMood
            activitiesVC.valueForProductivity = valueForProductivity
            activitiesVC.valueForStress = valueForStress
            
            //  let activitiesVC = segue.destination as!
    }
      
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
