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
        
        informationView.layer.cornerRadius = 7
        informationView.layer.shadowRadius = 2.5
        informationView.layer.masksToBounds = true
        informationView.layer.shadowColor = UIColor.systemGray.cgColor
        informationView.isHidden = true
        informationView.layer.backgroundColor = UIColor.systemGray6.cgColor
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       // load datas
           
       tableView.reloadData()
       }
    
    @IBOutlet weak var informationView: UIView!
    
    @IBAction func informationBtn(_ sender: Any) {
        tableView.alpha = 1
        addActivityBtn.alpha = 1
        advanceBtn.alpha = 1
        informationView.alpha = 0
        UIView.animate(withDuration: 1.5, animations: {
            self.tableView.alpha = 0
            self.addActivityBtn.alpha = 0
            self.advanceBtn.alpha = 0
            self.tableView.isHidden = true
            self.addActivityBtn.isHidden = true
            self.advanceBtn.isHidden = true
            self.informationView.alpha = 1
            self.informationView.isHidden = false
            
            
        })
        
        
    }
    
    
    @IBAction func closeBtn(_ sender: Any) {
        tableView.alpha = 0
               addActivityBtn.alpha = 0
               advanceBtn.alpha = 0
               informationView.alpha = 1
               UIView.animate(withDuration: 1.5, animations: {
                   self.tableView.alpha = 1
                   self.addActivityBtn.alpha = 1
                   self.advanceBtn.alpha = 1
                   self.tableView.isHidden = false
                   self.addActivityBtn.isHidden = false
                   self.advanceBtn.isHidden = false
                   self.informationView.alpha = 0
                   self.informationView.isHidden = true
                   
                   
               })
        
        
        
    }
    
    
    @IBOutlet weak var addActivityBtn: UIButton!
    
    
    @IBOutlet weak var advanceBtn: UIButton!
    
   
//        activitiesArray = nextVC.entryActivities
//        print(activitiesArray[0].name)
//        print(activitiesArray[1].name)
       // for i in nextVC.entryActivities{
         //   print(i.name)
        //}
    
    
    
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
