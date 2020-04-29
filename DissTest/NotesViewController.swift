//
//  NotesViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 01/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit
var notesLocation: String = ""
class NotesViewController: UIViewController {
    var valueForMood = 0
      var valueForStress = 0
      var valueForProductivity = 0
    var valueForSleep = 0
    var ValueForExercise = 0
    var valueForWater = 0
    var valueForAlcohol = 0
    var valueForSleepMinutes = 0
    var valueForExerciseMinutes = 0
    var valueForLocation = ""
    var valueForNotes = ""
    
    
  
    
    
    
    
    
    let date = Date()
           let dateFormatter = DateFormatter()
    let database = LogsViewController()
    
    
      
               
    
    //let database = DataStore()
    
    
    
    
    override func viewDidLoad() {
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from:date)
        notesTxt.layer.backgroundColor = UIColor.white.cgColor
        print(dateString)
        for i in entryActivities{
            print (i.name)
            print (i.description)
            print (i.length)
        }
        
        notesLbl.adjustsFontSizeToFitWidth = true
        
        print(valueForLocation)
       // dailyEntry.Date = dateString
      //  var dailyEntry: Mood = Mood(Date: dateString, Sleep: valueForSleep, Water: valueForWater, Stress: valueForStress, Exercise: ValueForExercise, Location: valueForLocation, Alcohol: valueForAlcohol, Mood: valueForMood, Productivity: valueForProductivity, Notes: "Today was a  bad day")
        //print(dailyEntry.toString())
       // blabla.hello.insertMoodObject(dailyEntry: dailyEntry)
       // print(dateString)
      //  print(dailyEntry.Date)
      //  var tester: Mood = Mood(Date: "80-03-2020" , Sleep: 5, Water: 5, Stress: 5, Exercise: 5, Location: "Test", Alcohol: 9, Mood: 9, Productivity: 9, Notes: "Hello")
      //  blabla.hello.insertMoodObject(dailyEntry: tester)
        super.viewDidLoad()
        //database.readRows()
        
      //  database.readRows()
     //   database.insertMoodObject(dailyEntry: tester)
       // print(dailyEntry.Location)
        //print(valueForLocation)
        //database.readRows()
        //database.insertMoodObject(dailyEntry: dailyEntry)
        // Do any additional setup after loading the view.
        
        backgroundView.layer.backgroundColor = UIColor.systemGray6.cgColor
        backgroundView.layer.cornerRadius = 7
        backgroundView.layer.masksToBounds = true
        saveBtn.layer.backgroundColor = UIColor.systemIndigo.cgColor
        saveBtn.layer.cornerRadius = 7
        saveBtn.layer.masksToBounds = true
        
        informationView.isHidden = true
        informationView.layer.cornerRadius = 7
        informationView.layer.masksToBounds = true
        informationView.layer.shadowRadius = 2.5
        informationView.layer.shadowColor = UIColor.systemGray.cgColor
        informationView.layer.shadowOffset = .zero
        informationView.layer.backgroundColor = UIColor.systemGray6.cgColor
        
    }
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var informationView: UIView!
    
    @IBOutlet weak var notesText: UITextView!
    @IBOutlet weak var notesTxt: UITextField!
    @IBAction func notesTxt(_ sender: Any) {
        //dailyEntry.Notes = notesTxt.text!
    }
    
    @IBAction func informationBtn(_ sender: Any) {
        backgroundView.alpha = 1
        saveBtn.alpha = 1
        informationView.alpha = 0
        
        UIView.animate(withDuration: 1.5, animations: {
            self.backgroundView.alpha = 0
            self.backgroundView.isHidden = true
            self.saveBtn.alpha = 0
            self.saveBtn.isHidden = true
            self.informationView.alpha = 1
            self.informationView.isHidden = false
            
    })
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        backgroundView.alpha = 0
              saveBtn.alpha = 0
              informationView.alpha = 1
              
              UIView.animate(withDuration: 1.5, animations: {
                  self.backgroundView.alpha = 1
                  self.backgroundView.isHidden = false
                  self.saveBtn.alpha = 1
                  self.saveBtn.isHidden = false
                  self.informationView.alpha = 0
                  self.informationView.isHidden = true
                  
          })
        
        
        
        
    }
    
    
    @IBOutlet weak var notesLbl: UILabel!
    
    @IBOutlet weak var informationBtn: UIBarButtonItem!
    @IBAction func saveBtn(_ sender: Any) {
        guard var notesValue = notesTxt.text else{ return
        }
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from:date)
        valueForNotes = notesTxt.text!
        print(notesValue)
        var valueForNotes2 = notesValue
        var dailyEntry: Mood = Mood(Date: dateString, Sleep: valueForSleep, Water: valueForWater, Stress: valueForStress, Exercise: ValueForExercise, Location: valueForLocation, Alcohol: valueForAlcohol, Mood: valueForMood, Productivity: valueForProductivity, Notes: valueForNotes2, SleepMinutes: valueForSleepMinutes, ExerciseMinutes: valueForExerciseMinutes)
        
        let alert = UIAlertController(title: "Confirmation", message: "Are you sure you want to complete this entry?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:  {
                action in self.database.databaseStore.insertMoodObject(dailyEntry: dailyEntry)
            self.database.databaseStore.insertDailyActivities(dailyActivities: entryActivities, date: dateString)
            //self.database.checkComplete()
            
            
                self.performSegue(withIdentifier: "unwindToLogsView", sender: self)

        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            
            
}
}







        
    //blabla.hello.insertMoodObject(dailyEntry: dailyEntry )

        
//
//            self.blabla.hello.insertMoodObject(dailyEntry: self.dailyEntry)
//   }))
//    }

    
    
    
    /**
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToLogsView" {
            let logsVC = segue.destination as! LogsViewController
            logsVC.btnStatus = true
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
}

 
 */


