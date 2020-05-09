//
//  ViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 16/02/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  First screen that the user will see
//

import UIKit

class LogsViewController: UIViewController {
   //Creates the database object
   let databaseStore = FinalDatabase()
    
   //Gets todays date
   let dateValue = Date()
   let dateForCheck = DateFormatter()
       

    
    
    
    override func viewDidLoad() {
        
        //Formats todays date to Day, Month, day number
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d"
        let dateString: String = dateFormatter.string(from:date)
       
        
        //checks to see if an entry has been completed already today
        
        
        
        super.viewDidLoad()
      
        entryTxt.text = "You have not yet completed your daily entry! It is important to complete it every day so that trends can be found to help improve your well-being."
        checkComplete()

        //Sets the title of the screen to todays date
        self.navigationController?.navigationBar.topItem?.title = dateString

        //Formats the views
        dailyEntryView.layer.cornerRadius = 20
        dailyEntryView.layer.masksToBounds = true
        dailyEntryView.layer.borderWidth = 5
        dailyEntryView.layer.borderColor = UIColor.systemGray6.cgColor
        dailyEntryView.layer.backgroundColor = UIColor.systemGray6.cgColor
        startBtn.layer.backgroundColor = UIColor.systemIndigo.cgColor
        startBtn.layer.cornerRadius = 5
        startBtn.layer.masksToBounds = true
        entryTxt.adjustsFontSizeToFitWidth = true
        symptomTxt.adjustsFontSizeToFitWidth = true
        startBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        symptomsView.layer.backgroundColor = UIColor.systemGray6.cgColor
        symptomsView.layer.cornerRadius = 20
        symptomsView.layer.masksToBounds = true
        symptomsBtn.layer.backgroundColor = UIColor.systemIndigo.cgColor
        symptomsBtn.layer.cornerRadius = 5
        symptomsBtn.layer.masksToBounds = true
        
   
    }
    
    
    //IBOutlets
    @IBOutlet weak var symptomTxt: UILabel!
    @IBOutlet weak var entryTxt: UILabel!
    @IBOutlet weak var symptomsBtn: UIButton!
    @IBOutlet weak var symptomsView: UIView!
    @IBOutlet weak var dailyTxt: UILabel!
    @IBOutlet weak var a: UINavigationItem!
    @IBOutlet weak var dailyView: UIView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var dailyEntryView: UIView!

    /**
     Checks to see if an entry has already been completed today,  and returns a boolean value.
     */
    func checkComplete()-> Bool {
        dateForCheck.dateFormat = "dd-MM-yyyy"
        let dateCheckString = dateForCheck.string(from:dateValue)
        var check = databaseStore.checkEntryComplete(date: dateCheckString)
        if check == true {
            //Hides the start button if an entry has already been completed
            startBtn.isHidden = true
            var text: String = "Daily entry is complete! Go to the trends tab to view previous entries and learn about your mood. Come back tomorrow to complete your next entry."
            entryTxt.text = text
        } else {
            startBtn.isHidden = false
        }
        return check
    }
    
    /**
     Stops the user starting the daily entry if an entry has already been completed.
     */
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "symptom"{
            return true
            
        } else {
        var check = checkComplete()
        if check == false {
            return true
        } else {
            let alert = UIAlertController(title:"Daily Entry", message: "Todays entry is already complete!",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            self.present(alert,animated: true)

        return false
        }
        }
    }

    
    
    
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }
   
    
}

