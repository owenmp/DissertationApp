//
//  EntryDetailViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 25/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

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
    var valueForDate = ""
    var valueForColor = UIColor.systemGray6.cgColor

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = valueForDate
        let colour = getColourForCell(value: valueForMood)
        moodValueLbl.text = String(valueForMood)
        alcoholValueLbl.text = String(valueForAlcohol)
        productivityValueLbl.text = String(valueForProductivity)
        waterValueLbl.text = String(valueForWater)
        sleepValueLbl.text = String(valueForSleep)
        exerciseValueLbl.text = String(valueForExercise)
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
        
        

        // Do any additional setup after loading the view.
    }
    
    
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "activities" {
            let activitiesVC = segue.destination as! EntryActivitiesTableViewController
            activitiesVC.dateValue = valueForDate
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
