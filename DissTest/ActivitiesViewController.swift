//
//  ActivitiesViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 13/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit
var entryActivities: [activityLog] = []


class ActivitiesViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var valueForMood = 0
      var valueForStress = 0
      var valueForProductivity = 0
    var valueForSleepHours = 0
    var ValueForExercise = 0
    var valueForWater = 0
    var valueForAlcohol = 0
    var valueForLocation = ""
    var valueForSleepMinutes = 0
    var valueForExerciseMinutes = 0
    var nextVC = ActivitiesTableViewController()
    
    let cellReuseIdentifier = "activityIdentifier"
    @IBOutlet weak var tableView: UITableView!
   // var activitiesArray: [activityLog] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        print(valueForSleepHours)
        print(ValueForExercise)
        print(valueForWater)
        print(valueForAlcohol)
        print(valueForLocation)
        print(valueForSleepMinutes)
        print(valueForExerciseMinutes)
        tableView.delegate = self
        tableView.dataSource = self
       // activitiesArray = nextVC.entryActivities
        // Do any additional setup after loading the view.
        
        addActivityBtn.layer.cornerRadius = 7
        addActivityBtn.layer.masksToBounds = true
        addActivityBtn.layer.backgroundColor = UIColor.systemBlue.cgColor
        advanceBtn.layer.cornerRadius = 7
        advanceBtn.layer.masksToBounds = true
        advanceBtn.layer.backgroundColor = UIColor.systemIndigo.cgColor
        
    }
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       // load datas
           
       tableView.reloadData()
       }
    
    
    @IBOutlet weak var addActivityBtn: UIButton!
    
    
    @IBOutlet weak var advanceBtn: UIButton!
    
    @IBAction func refreshBtn(_ sender: Any) {
        
        self.tableView.reloadData()
        self.viewDidLoad()
        
        for i in entryActivities{
            print(i.name)
        }
//        activitiesArray = nextVC.entryActivities
//        print(activitiesArray[0].name)
//        print(activitiesArray[1].name)
       // for i in nextVC.entryActivities{
         //   print(i.name)
        //}
    }
    
    
   func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        entryActivities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)as! dailyActivityTableViewCell
        let wantedName = entryActivities[indexPath.row].name
        cell.nameLbl.text = wantedName
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
    }
    
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            entryActivities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            print("insert")
            
        }
    }
    
    
//     func tableView(_tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
//        
//
//        let configuration = ""
//        return configuration
  //  }
    
    
    
    

    
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
            notesVC.valueForSleep = valueForSleepHours
            notesVC.valueForStress = valueForStress
            notesVC.valueForSleepMinutes = valueForSleepMinutes
                       notesVC.valueForExerciseMinutes = valueForExerciseMinutes
//            notesVC.dailyEntry.Alcohol = valueForAlcohol
//            notesVC.dailyEntry.Exercise = ValueForExercise
//            notesVC.dailyEntry.Location = valueForLocation
//            notesVC.dailyEntry.Mood = valueForMood
//    notesVC.dailyEntry.Productivity = valueForProductivity
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
