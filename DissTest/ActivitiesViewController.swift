//
//  ActivitiesViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 13/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {
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
        print(valueForSleep)
        print(ValueForExercise)
        print(valueForWater)
        print(valueForAlcohol)
        print(valueForLocation)
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "activitySegue" {
            let notesVC = segue.destination as! NotesViewController
            notesVC.valueForMood = valueForMood
            notesVC.valueForProductivity = valueForProductivity
            notesVC.ValueForExercise = ValueForExercise
            notesVC.valueForLocation = valueForLocation
            notesVC.valueForAlcohol = valueForAlcohol
            notesVC.valueForWater = valueForWater
            notesVC.valueForSleep = valueForSleep
            notesVC.dailyEntry.Alcohol = valueForAlcohol
            notesVC.dailyEntry.Exercise = ValueForExercise
            notesVC.dailyEntry.Location = valueForLocation
            notesVC.dailyEntry.Mood = valueForMood
    notesVC.dailyEntry.Productivity = valueForProductivity
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
