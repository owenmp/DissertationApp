//
//  NotesViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 01/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    var valueForMood = 0
      var valueForStress = 0
      var valueForProductivity = 0
    var valueForSleep = 0
    var ValueForExercise = 0
    var valueForWater = 0
    var valueForAlcohol = 0
    var valueForLocation = ""
    var valueForNotes = ""
    
    let date = Date()
           let dateFormatter = DateFormatter()
    let blabla = LogsViewController()
    
    
       
               
    var dailyEntry: Mood = Mood(Date: "", Sleep: 0, Water: 0, Stress: 0, Exercise: 0, Location: "", Alcohol: 0, Mood: 0, Productivity: 0, Notes: "")
    let database = DataStore()
    
    
    
    
    override func viewDidLoad() {
        dateFormatter.dateFormat = "dd-mm-yy"
        let dateString = dateFormatter.string(from:date)
        dailyEntry.Date = dateString
        print(dateString)
      //  print(dailyEntry.Date)
      //  var tester: Mood = Mood(Date: "80-03-2020" , Sleep: 5, Water: 5, Stress: 5, Exercise: 5, Location: "Test", Alcohol: 9, Mood: 9, Productivity: 9, Notes: "Hello")
      //  blabla.hello.insertMoodObject(dailyEntry: tester)
        super.viewDidLoad()
        database.readRows()
        
        database.readRows()
     //   database.insertMoodObject(dailyEntry: tester)
       // print(dailyEntry.Location)
        //print(valueForLocation)
        //database.readRows()
        //database.insertMoodObject(dailyEntry: dailyEntry)
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var notesText: UITextView!
    @IBOutlet weak var notesTxt: UITextField!
    @IBAction func notesTxt(_ sender: Any) {
        dailyEntry.Notes = notesTxt.text!
    }
    
    
    @IBAction func saveBtn(_ sender: Any) {
      // database.insertMoodObject(dailyEntry: tester)
        guard var notesValue = notesTxt.text else{ return
            
        }
        var valueForNotes = notesValue
        
        valueForNotes = notesTxt.text!
        print(notesValue)
        dailyEntry.Notes = valueForNotes
        print(dailyEntry.Notes)
        database.insertMoodObject(dailyEntry: dailyEntry)
        let alert = UIAlertController(title: "Confirmation", message: "Are you sure you want to complete this entry?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            action in self.database.insertMoodObject(dailyEntry: self.dailyEntry)
            print(self.dailyEntry.Date)
            self.performSegue(withIdentifier: "unwindToLogsView", sender: self)
            
            
        
    
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        
        
            self.blabla.hello.insertMoodObject(dailyEntry: self.dailyEntry)
   }))
    }

    
    
    
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

}
