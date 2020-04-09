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
    var valueForSleep = 0
    var ValueForExercise = 0
    var valueForWater = 0
    var valueForAlcohol = 0
    var valueForLocation = ""
    var nextVC = ActivitiesTableViewController()
    
    let cellReuseIdentifier = "activityIdentifier"
    @IBOutlet weak var tableView: UITableView!
   // var activitiesArray: [activityLog] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        print(valueForSleep)
        print(ValueForExercise)
        print(valueForWater)
        print(valueForAlcohol)
        print(valueForLocation)
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
            notesVC.valueForStress = valueForStress
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
