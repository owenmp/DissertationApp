//
//  EntryDetailViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 25/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  Shows all the values associated with a mood value

import UIKit

class EntryDetailViewController: UIViewController {
    var moodDescription = "a"
    var productivityDescription = ""
    var stressDescription = ""
    var valueForNotes = ""
    var valueForMood = 0
    var valueForStress = 0
    var valueForWater = 0
    var valueForSleep = 0
    var valueForExercise = 0
    var valueForAlcohol = 0
    var valueForProductivity = 0
    var valueForLocation = ""
    var valueForDate = ""
    var valueForSleepMins = 0
    var valueForExerciseMins = 0
    var valueForColor = UIColor.systemGray6.cgColor

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = valueForDate
        //formats the text to show the correct units
        let colour = getColourForCell(value: valueForMood)
        moodValueLbl.text = String(valueForMood)
        var alcoholText = ""
        alcoholText += String(valueForAlcohol)
        alcoholText += " Units"
        
        alcoholValueLbl.text = alcoholText
        productivityValueLbl.text = String(valueForProductivity)
        
        var waterText = ""
        waterText += String(valueForWater)
        waterText += " Litres"
        
        waterValueLbl.text = waterText
        var sleepHoursText = ""
        sleepHoursText += String(valueForSleep)
        sleepHoursText += "h"
        sleepValueLbl.text = sleepHoursText
        var exerciseHoursText = ""
        exerciseHoursText += String(valueForExercise)
        exerciseHoursText += "h"
        exerciseValueLbl.text = exerciseHoursText
        var sleepMinsText = ""
            sleepMinsText += String(valueForSleepMins)
        sleepMinsText += "m"
        sleepMinsLbl.text = sleepMinsText
        var exerciseMinsText = ""
        exerciseMinsText += String(valueForExerciseMins)
        exerciseMinsText += "m"
        exerciseMinsLbl.text = exerciseMinsText
        notesLbl.text = valueForNotes
        stressValueLbl.text = String(valueForStress)
        lifestyleView.layer.backgroundColor = colour.cgColor
        lifestyleView.layer.cornerRadius = 7
        lifestyleView.layer.masksToBounds = true
        notesView.layer.backgroundColor = colour.cgColor
        notesView.layer.cornerRadius = 7
        notesView.layer.masksToBounds = true
        
        dailyValuesView.layer.backgroundColor = colour.cgColor
        dailyValuesView.layer.cornerRadius = 7
        dailyValuesView.layer.masksToBounds = true
        activitiesBtn.layer.cornerRadius = 7
        activitiesBtn.layer.backgroundColor = UIColor.systemIndigo.cgColor
        activitiesBtn.layer.masksToBounds = true
        moodDescription = getMoodDescription(value: valueForMood)
        
        moodDescLbl.text = moodDescription
        stressDescription = getStressDescription(value: valueForStress)
        stressDescLbl.text = stressDescription
        productivityDescription = getProductivityDescription(value: valueForProductivity)
        productivityDescLbl.text = productivityDescription
        locationValueLbl.text = valueForLocation
        symptomsBtn.layer.backgroundColor = UIColor.systemBlue.cgColor
        symptomsBtn.layer.cornerRadius = 7
        symptomsBtn.layer.masksToBounds = true
        
        goalsBtn.layer.backgroundColor = UIColor.systemGreen.cgColor
              goalsBtn.layer.cornerRadius = 7
              goalsBtn.layer.masksToBounds = true
        
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var goalsBtn: UIButton!
    @IBAction func goalsBtn(_ sender: Any) {
    }
    
    @IBOutlet weak var exerciseMinsLbl: UILabel!
    
    @IBOutlet weak var sleepMinsLbl: UILabel!
    
    @IBOutlet weak var symptomsBtn: UIButton!
    
    @IBOutlet weak var locationValueLbl: UILabel!
    
    @IBOutlet weak var stressDescLbl: UILabel!
    @IBOutlet weak var productivityDescLbl: UILabel!
    @IBOutlet weak var moodDescLbl: UILabel!
    @IBOutlet weak var activitiesBtn: UIButton!
    @IBOutlet weak var notesView: UIView!
    @IBOutlet weak var lifestyleView: UIView!
    @IBOutlet weak var dailyValuesView: UIView!
    @IBOutlet weak var notesLbl: UILabel!
    @IBOutlet weak var alcoholValueLbl: UILabel!
    @IBOutlet weak var exerciseValueLbl: UILabel!
    @IBOutlet weak var sleepValueLbl: UILabel!
    
    @IBOutlet weak var waterValueLbl: UILabel!
    
    @IBOutlet weak var stressValueLbl: UILabel!
    @IBOutlet weak var moodValueLbl: UILabel!
    
    @IBOutlet weak var productivityValueLbl: UILabel!
    
    
    
    
    //gets background colour based on mood value
    func getColourForCell(value: Int) -> UIColor {
           let number = value
           switch number {
           case 1 :
               return UIColor.init(red: 1, green: 0.72941176, blue: 0.72941176, alpha: 1)
               case 2:
                   return UIColor.init(red: 0.98823529, green: 0.83921569, blue: 0.8, alpha: 1)
               case 3:
                   return UIColor.init(red: 0.98823529, green: 0.9911111, blue: 0.90666667, alpha: 1)
               case 4:
                   return UIColor.init(red: 0.98823529, green: 0.96470588, blue: 0.8, alpha: 1)
           case 5:
                   return UIColor.init(red: 0.97254902, green: 0.98823529, blue: 0.8, alpha: 1)
           case 6:
               return UIColor.init(red: 0.921568, green: 0.98823529, blue: 0.8, alpha: 1)
               case 7:
                   return UIColor.init(red: 0.894117, green: 0.988235, blue: 0.8, alpha: 1)
               case 8:
                   return UIColor.init(red: 0.854901, green: 0.968627, blue: 0.7843137, alpha: 1)
               case 9:
                   return UIColor.init(red: 0.7099, green: 0.9215, blue: 0.74901, alpha: 1)
               case 10:
               return UIColor.init(red: 0.6588, green: 0.9294, blue: 0.737255, alpha: 1)
           default: return UIColor.systemBlue
           }
    }
    
    //sets adjective based on mood value
    
    private func getMoodDescription(value: Int) -> String{
        var description = ""
        switch value {
        case 1: description = "Very Bad"
        case 2: description = "Very Bad"
        case 3: description = "Bad"
        case 4: description = "Unpleasant"
        case 5: description =  "Neutral"
        case 6: description =  "Above average"
        case 7: description =  "Good"
        case 8: description =  "Good"
        case 9: description =  "Very Good"
        case 10: description = "Excellent"
        default:
            "No Data"
        }
        
        
        
        
        
       // var description = "Blabla"
        
        return description
    }
    
    //sets adjective based on stress value
       
     private func getStressDescription(value: Int) -> String{
    var description = ""
    switch value {
    case 1: description = "Very Stressed"
    case 2: description = "Very Stressed"
    case 3: description = "Stressed"
    case 4: description = "Stressed"
    case 5: description =  "Somewhat Stressed"
    case 6: description =  "A little Stressed"
    case 7: description =  "Not very"
    case 8: description =  "Not very"
    case 9: description =  "Not really"
    case 10: description = "Not at all"
    default:
        "No Data"
    }
        return description
    }
    
    //sets adjective based on productivity value
       
    private func getProductivityDescription(value: Int) -> String{
    var description = ""
    switch value {
    case 1: description = "Not at all"
    case 2: description = "Not at all"
    case 3: description = "Unproductive"
    case 4: description = "Unproductive"
    case 5: description =  "Moderatley"
    case 6: description =  "Somewhat"
    case 7: description =  "Quite productive"
    case 8: description =  "Productive"
    case 9: description =  "Very Productive"
    case 10: description = "Very Productive"
    default:
        "No Data"
    }
        return description
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //opens relevant table view, to show activities, symptoms and goals
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "activities" {
            let activitiesVC = segue.destination as! EntryActivitiesTableViewController
            activitiesVC.dateValue = valueForDate
        } else if segue.identifier == "symptomIdentifier" {
            let symptomsVC = segue.destination as! entrySymptomsTableViewController
            symptomsVC.dateString = valueForDate
        } else if segue.identifier == "goals" {
            let goalsVC = segue.destination as! entryGoalsTableViewController
            goalsVC.dateString = valueForDate
            
            
            
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
