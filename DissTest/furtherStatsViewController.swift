//
//  furtherStatsViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 27/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//Class to display further stats from the advice screen

import UIKit

class furtherStatsViewController: UIViewController {
    
    var db = LogsViewController()
    //var dates = db.databaseStore.getGoodDates()
    
   // var activities = db.databaseStore.getGoodActivities(dates: dates)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        activityView.layer.backgroundColor = UIColor.systemGray6.cgColor
        activityView.layer.cornerRadius = 7
        activityView.layer.masksToBounds = true
        createActivityText()
        symptomsView.layer.backgroundColor = UIColor.systemGray6.cgColor
        symptomsView.layer.cornerRadius = 7
        
        symptomsView.layer.masksToBounds = true
        createSymptomsText()
        
    }
    
    
    
    //Shows the good and bad activities
    func createActivityText(){
        activityText = "Your common activities when your mood is good, include: "
        badActivityText = "Your common activities when your mood is bad, include:"
        var dates = db.databaseStore.getGoodDates()
        var badDates = db.databaseStore.getBadDates()
        var badActivity = db.databaseStore.getGoodActivities(dates: badDates)
        var nonDuplicateBad = badActivity.removingDuplicate()
         var activities = db.databaseStore.getGoodActivities(dates: dates)
        var nonDuplicate = activities.removingDuplicate()
       // nonDuplicateBad.removeAll(where: {$0 != "Eating out"})
        //nonDuplicateBad.removeAll(where: {$0 != "Dissertation "})
        for i in nonDuplicate {
            var word = i
            //removes duplicates from the array
            var last = nonDuplicate[nonDuplicate.count-1]
            if word == last {
                
                activityText += i
                activityText += "."
                
            } else {
            
            //formats the text to structure a sentence correctly.
            activityText += i
            activityText += ", "
            
            }
        }
            for i in nonDuplicateBad {
            var word = i
            var last = nonDuplicateBad[nonDuplicateBad.count-1]
            if word == last {
                
                badActivityText += i
                badActivityText += "."
                
            } else {
            
            
            badActivityText += i
            badActivityText += ", "
            
            }
            
            
            
            
            
        }
        badActivityLbl.text = badActivityText
        activityLbl.text = activityText
        
        
    
    }
    //Shows symptoms from days with poor mood.
    
    func createSymptomsText(){
        symptomsText = "Your common symptoms when your mood is poor include: "
        var dates = db.databaseStore.getBadDates()
        var symptoms = db.databaseStore.getBadSymptoms(dates: dates)
        var nonDuplicate = symptoms.removingDuplicate()
        if nonDuplicate.count == 1 {
            symptomsText = "You currently do not have any data for symptoms when your mood has been poor."
        } else {
            
            for i in nonDuplicate {
                var word = i
                var last = nonDuplicate[nonDuplicate.count-1]
                if word == last {
                    
                    symptomsText += i
                    symptomsText += "."
                    
                } else {
                
                
                symptomsText += i
                symptomsText += ", "
                
                }
            }
            
            
        }
        symptomsLbl.text = symptomsText
        
        
    }
    
    var symptomsText = ""
    
    //IBOutlets
    
    @IBOutlet weak var symptomsView: UIView!
    
    
    @IBOutlet weak var symptomsLbl: UILabel!
    
    @IBOutlet weak var badActivityLbl: UILabel!
    
    @IBOutlet weak var activityLbl: UILabel!
    var activityText = ""
    var badActivityText = ""
    
    @IBOutlet weak var activityView: UIView!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
