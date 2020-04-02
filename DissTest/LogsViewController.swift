//
//  ViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 16/02/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class LogsViewController: UIViewController {
    let hello = DataStoreRebuild()
   
    

    
    @IBOutlet weak var a: UINavigationItem!
    
    override func viewDidLoad() {
        
        //hello.insertNewActivity(Name: "Drawing", Description: "SecondTest") //hello.searchEntries(filter: "Location", value: "University")
        //print("The segue test worked")
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d"
        let dateString: String = dateFormatter.string(from:date)
        //print(dateString)
        let test = Mood(Date: dateString, Sleep: 5, Water: 5, Stress: 5, Exercise: 5, Location: "K", Alcohol: 3, Mood: 4, Productivity: 7, Notes: "I had a great day today")
        
        
   
       
        //////// It can still enter the database, button to enter it must be broken, maybe to do with the segue change i attempted

    
        super.viewDidLoad()
        
       // hello.insertMoodObject(dailyEntry: test)
      //  hello.readRows()
       // hello.insertMoodObject(dailyEntry: test)
       // hello.readRows()
      //  hello.deleteEntries()
        //hello.getAllEntries()
       // hello.getAllEntries()
        //hello.getEntryActivities(date: "07-03-2020")
       // hello.getAveragesForMood3(moodLevel: 7)
       // self.presentedViewController?.title = dateString
        self.navigationController?.navigationBar.topItem?.title = dateString
        dailyQuoteView.layer.borderWidth = 5
        dailyQuoteView.layer.borderColor = UIColor.systemGray6.cgColor
        dailyQuoteView.layer.backgroundColor = UIColor.systemGray6.cgColor
        dailyQuoteView.layer.shadowColor = UIColor.black.cgColor
        
        dailyQuoteView.layer.shadowOpacity = 10
        dailyQuoteView.layer.shadowOffset = .zero
        dailyQuoteView.layer.shadowRadius = 20
        dailyQuoteView.layer.cornerRadius = 20
        dailyQuoteView.layer.masksToBounds = true
        
        dailyEntryView.layer.cornerRadius = 20
        dailyEntryView.layer.masksToBounds = true
        dailyEntryView.layer.borderWidth = 5
        dailyEntryView.layer.borderColor = UIColor.systemGray6.cgColor
        dailyEntryView.layer.backgroundColor = UIColor.systemGray6.cgColor
        startBtn.layer.backgroundColor = UIColor.systemIndigo.cgColor
        startBtn.layer.cornerRadius = 5
        startBtn.layer.masksToBounds = true
        dailyTxt.adjustsFontSizeToFitWidth = true
       
//
        // Do any additional setup after loading the view.
    }
    
   
    @IBOutlet weak var dailyTxt: UILabel!
    @IBOutlet weak var dailyView: UIView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var dailyQuoteView: UIView!
    
    @IBOutlet weak var dailyEntryView: UIView!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }
   
    
}

