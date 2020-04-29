//
//  LifestyleEntryViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 13/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class LifestyleEntryViewController: UIViewController{
    var valueForMood = 0
    var valueForStress = 0
    var valueForProductivity = 0
    var valueForSleepHours = 0
      var ValueForExerciseHours = 0
      var valueForWater = 0
      var valueForAlcohol = 0
    var valueForExerciseMinutes = 0
    var valueForSleepMinutes = 0
      var valueForLocation = ""
    var optionHour = ""
    var sleepHour = ""
    let hoursSleepOptions = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23"]
    let hoursExerciseOptions = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23"]

    override func viewDidLoad() {
        super.viewDidLoad()
        print(valueForMood)
        print(valueForStress)
        print(valueForProductivity)
        
//        let pickerViewHours = UIPickerView()
//        pickerViewHours.delegate = self
//        exerciseHouseTxt.inputView = pickerViewHours
//        sleepHoursTxt.inputView = pickerViewHours
        
        
        
        sleepView.layer.cornerRadius = 7
        sleepView.layer.masksToBounds = true
        sleepView.layer.backgroundColor = UIColor.systemGray6.cgColor
        waterView.layer.cornerRadius = 7
              waterView.layer.masksToBounds = true
              waterView.layer.backgroundColor = UIColor.systemGray6.cgColor
        alcoholView.layer.cornerRadius = 7
              alcoholView.layer.masksToBounds = true
              alcoholView.layer.backgroundColor = UIColor.systemGray6.cgColor
        locationView.layer.cornerRadius = 7
              locationView.layer.masksToBounds = true
              locationView.layer.backgroundColor = UIColor.systemGray6.cgColor
        exerciseView.layer.cornerRadius = 7
              exerciseView.layer.masksToBounds = true
              exerciseView.layer.backgroundColor = UIColor.systemGray6.cgColor
        advanceBtn.layer.backgroundColor = UIColor.systemIndigo.cgColor
        advanceBtn.layer.cornerRadius = 7
        advanceBtn.layer.masksToBounds = true
        errorTxt.isHidden = true
        informationView.isHidden = true
        informationView.layer.cornerRadius = 7
        informationView.layer.masksToBounds = true
        informationView.layer.shadowColor = UIColor.systemGray.cgColor
        informationView.layer.shadowRadius = 2.5
        informationView.layer.backgroundColor = UIColor.systemGray6.cgColor
        sleepHoursTxt.keyboardType = UIKeyboardType.numberPad
        waterTxt.keyboardType = UIKeyboardType.numberPad
        sleepMinutes.keyboardType = UIKeyboardType.numberPad
        exerciseHouseTxt.keyboardType = UIKeyboardType.numberPad
        exerciseMinutes.keyboardType = UIKeyboardType.numberPad
        alcoholTxt.keyboardType = UIKeyboardType.numberPad

        // Do any additional setup after loading the view.
    }
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if pickerView.tag == 1 {
//        return hoursSleepOptions.count
//        } else {
//            return hoursExerciseOptions.count
//        }
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if pickerView.tag == 1 {
//        return hoursSleepOptions[row]
//        } else {
//            return hoursExerciseOptions[row]
//        }
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if pickerView.tag == 1 {
//        sleepHoursTxt.text = hoursSleepOptions[row]
//        sleepHour = hoursSleepOptions[row]
//        var sleepValue = Int(sleepHour)!
//        valueForSleep = sleepValue
//        } else {
//
//
//        exerciseHouseTxt.text = hoursExerciseOptions[row]
//        optionHour = hoursExerciseOptions[row]
//        var value = Int(optionHour)!
//        ValueForExercise = value
//        print(optionHour)
//        }
//    }
//
    
//    @IBAction func printBtn(_ sender: Any) {
//        //var text = locationTxtField.text!
//        print(valueForLocation)
//    }
    
    @IBOutlet weak var errorTxt: UILabel!
    
    @IBOutlet weak var locationTxtField: UITextField!
    
    
    @IBAction func informationBtn(_ sender: Any) {
        alcoholView.alpha = 1
        sleepView.alpha = 1
        locationView.alpha = 1
        exerciseView.alpha = 1
        waterView.alpha = 1
        advanceBtn.alpha = 1
        informationView.alpha = 0
        UIView.animate(withDuration: 1.5, animations: {
            self.alcoholView.alpha = 0
            self.alcoholView.isHidden = true
            self.sleepView.alpha = 0
            self.sleepView.isHidden = true
            self.locationView.alpha = 0
            self.locationView.isHidden = true
            self.exerciseView.alpha = 0
            self.exerciseView.isHidden = true
            self.waterView.alpha = 0
            self.waterView.isHidden = true
            self.advanceBtn.alpha = 0
            self.advanceBtn.isHidden = true
            self.informationView.alpha = 1
            self.informationView.isHidden = false
        })
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        alcoholView.alpha = 0
               sleepView.alpha = 0
               locationView.alpha = 0
               exerciseView.alpha = 0
               waterView.alpha = 0
               advanceBtn.alpha = 0
               informationView.alpha = 1
               UIView.animate(withDuration: 1.5, animations: {
                   self.alcoholView.alpha = 1
                   self.alcoholView.isHidden = false
                   self.sleepView.alpha = 1
                   self.sleepView.isHidden = false
                   self.locationView.alpha = 1
                   self.locationView.isHidden = false
                   self.exerciseView.alpha = 1
                   self.exerciseView.isHidden = false
                   self.waterView.alpha = 1
                   self.waterView.isHidden = false
                   self.advanceBtn.alpha = 1
                   self.advanceBtn.isHidden = false
                   self.informationView.alpha = 0
                   self.informationView.isHidden = false
               })
        sleepTxt.adjustsFontSizeToFitWidth = true
        waterLbl.adjustsFontSizeToFitWidth = true
        
    }
    
    
    @IBOutlet weak var waterLbl: UILabel!
    
    @IBOutlet weak var sleepTxt: UILabel!
    
    
    @IBOutlet weak var exerciseMinutes: UITextField!
    
    
    @IBOutlet weak var informationView: UIView!
    
    @IBOutlet weak var sleepMinutes: UITextField!
    @IBOutlet weak var advanceBtn: UIButton!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var alcoholView: UIView!
    @IBOutlet weak var sleepView: UIView!
    
    @IBOutlet weak var exerciseView: UIView!
    
    @IBOutlet weak var waterView: UIView!
    
    
    @IBOutlet weak var sleepHoursTxt: UITextField!
//    @IBAction func sleepHoursField(_ sender: Any) {
//        if sleepHoursTxt.text == "" {
//            valueForSleepHours = 0
//        } else {
//        var text: String = sleepHoursTxt.text!
//        var value = Int(text)
//        valueForSleepHours = value!
//        }
        
   // }
    
    
//    @IBAction func sleepHoursField(_ sender: Any) {
//        if sleepHoursTxt.text == "" {
//            valueForSleepHours = 0
//        } else {
//        var text: String = sleepHoursTxt.text!
//        var value = Int(text)
//        valueForSleepHours = value!
//        }
//    }
    
    
    @IBAction func sleepHoursField(_ sender: Any) {
        if sleepHoursTxt.text == "" {
            valueForSleepHours = 0
        } else {
        var text: String = sleepHoursTxt.text!
        var value = Int(text)
        valueForSleepHours = value!
        }

    }
    
    
    
    @IBOutlet weak var exerciseHouseTxt: UITextField!
//    @IBAction func exerciseHoursTxt(_ sender: Any) {
//        if exerciseHouseTxt.text == "" {
//            ValueForExerciseHours = 0
//        } else {
//        var text: String = exerciseHouseTxt.text!
//        var value = Int(text)
//        ValueForExerciseHours = value!
//        }
//    }
    
    @IBAction func exerciseHouseTxt(_ sender: Any) {
        if exerciseHouseTxt.text == "" {
                   ValueForExerciseHours = 0
               } else {
               var text: String = exerciseHouseTxt.text!
               var value = Int(text)
               ValueForExerciseHours = value!
               }
    }
    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var waterTxt: UITextField!
    
//    @IBAction func waterTxt(_ sender: Any) {
//        if waterTxt.text == "" {
//            valueForWater = 0
//        } else {
//        var text: String = waterTxt.text!
//        var value = Int(text)
//        valueForWater = value!
//        }
//    }
    
    
    @IBAction func waterTxt(_ sender: Any) {
        if waterTxt.text == "" {
            valueForWater = 0
        } else {
        var text: String = waterTxt.text!
        var value = Int(text)
        valueForWater = value!
        }
    }
    
    
    
    
    
    
//    @IBAction func exerciseMinutes(_ sender: Any) {
//        if exerciseMinutes.text == "" {
//            valueForExerciseMinutes = 0
//        } else {
//        var text: String = exerciseMinutes.text!
//        var value = Int(text)!
//        valueForExerciseMinutes = value
//        }
//
//    }
    
    
   
    @IBAction func exerciseMinutes(_ sender: Any) {
        if exerciseMinutes.text == "" {
            valueForExerciseMinutes = 0
        } else {
        var text: String = exerciseMinutes.text!
        var value = Int(text)!
        valueForExerciseMinutes = value
        }
    }
    
    
    
    
    
//    @IBAction func sleepMinutes(_ sender: Any) {
//        if sleepMinutes.text == "" {
//            valueForSleepMinutes = 0
//
//        } else {
//        var text: String = sleepMinutes.text!
//        var value = Int(text)!
//        valueForSleepMinutes = value
//        }
   // }
    
    
    @IBAction func sleepMinutes(_ sender: Any) {
        if sleepMinutes.text == "" {
            valueForSleepMinutes = 0
            
        } else {
        var text: String = sleepMinutes.text!
        var value = Int(text)!
        valueForSleepMinutes = value
        }

    }
    
    
    
    
    
    @IBOutlet weak var alcoholTxt: UITextField!
    
    @IBAction func AlcoholTxt(_ sender: Any) {
        if alcoholTxt.text == ""{
            valueForAlcohol = 0
        }else {
        var text: String = alcoholTxt.text!
        var value = Int(text)
        valueForAlcohol = value!
        }
    }
    
    
//    @IBAction func locationTxtField(_ sender: Any) {
//        var text: String = locationTxtField.text!
//        valueForLocation = text
//        print(valueForLocation)
//    }
//
   
    @IBAction func locationTxtField(_ sender: Any) {
        var text: String = locationTxtField.text!
               valueForLocation = text
               //print(valueForLocation)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if locationTxtField.text == "" || sleepHoursTxt.text == "" || sleepMinutes.text == "" || exerciseMinutes.text == "" || exerciseHouseTxt.text == "" || alcoholTxt.text == "" {
            errorTxt.isHidden = false
            errorTxt.text = "Not all fields completed"
            return false
        }else if valueForSleepHours > 23 || valueForSleepHours < 0 {
            
            errorTxt.text = "Hours for sleep cannot be over 23"
            errorTxt.isHidden = false
            return false
        } else if valueForSleepMinutes > 59 || valueForSleepMinutes < 0{
            errorTxt.text = "Minutes for sleep must be between 0 and 59"
            errorTxt.isHidden = false
            return false
        }else if valueForExerciseMinutes > 59 || valueForExerciseMinutes < 0 {
            errorTxt.text = "Minutes for exercise must be between 0 and 59"
            errorTxt.isHidden = false
            return false
        } else if ValueForExerciseHours > 23 || ValueForExerciseHours < 0 {
            errorTxt.text = "Hours for exercise must be between 0 and 23"
            errorTxt.isHidden = false
            return false
            } else{
        errorTxt.isHidden = true
        return true
        }
        
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
        
       
        guard var minutesSleep = sleepMinutes.text else { return}
       let minSleep = Int(minutesSleep) ?? 0
        guard var minutesExercise = exerciseMinutes.text else { return}
        let minExercise = Int(minutesExercise) ?? 0
        
        
        ////////////
        valueForExerciseMinutes = minExercise
        valueForSleepMinutes = minSleep
        valueForAlcohol = valueForAlc
        valueForWater = valueForWate
        ValueForExerciseHours = valueForEx
        valueForSleepHours = valueForSlee
       
        print(valueForSleepHours)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "lifestyleSegue" {
            
            
            
            
            
            
            
            
            
            
            
            let activitiesVC = segue.destination as! ActivitiesViewController
            activitiesVC.valueForSleepHours = valueForSleepHours
        activitiesVC.ValueForExercise = ValueForExerciseHours
            activitiesVC.valueForWater = valueForWater
            activitiesVC.valueForAlcohol = valueForAlcohol
           
            activitiesVC.valueForMood = valueForMood
            activitiesVC.valueForProductivity = valueForProductivity
            activitiesVC.valueForStress = valueForStress
            activitiesVC.valueForSleepMinutes = valueForSleepMinutes
            activitiesVC.valueForExerciseMinutes = valueForExerciseMinutes
            activitiesVC.valueForLocation = valueForLocation
            
            //  let activitiesVC = segue.destination as!
    }
      
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
