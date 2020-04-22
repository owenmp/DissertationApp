//
//  ViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 16/02/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class LogsViewController: UIViewController {
    //let databaseStore = DataStoreRebuild()
   let databaseStore = FinalDatabase()
//    let dateValue = Date()
//          let dateForCheck = DateFormatter()
       

    
    @IBOutlet weak var a: UINavigationItem!
    
    override func viewDidLoad() {
        
       
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d"
        let dateString: String = dateFormatter.string(from:date)
        databaseStore.getAllDates()
        
//        dateForCheck.dateFormat = "dd-MM-yyyy"
//        let dateCheckString = dateForCheck.string(from:dateValue)
        
        
        
        
   
       
        //////// It can still enter the database, button to enter it must be broken, maybe to do with the segue change i attempted

        
        super.viewDidLoad()
//        var check = databaseStore.checkEntryComplete(date: "01-04-2020")
//        print(check)
//        var check2 = databaseStore.checkEntryComplete(date: "30-04-2020")
//        print(check2)

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
        symptomsView.layer.backgroundColor = UIColor.systemGray6.cgColor
        symptomsView.layer.cornerRadius = 20
        symptomsView.layer.masksToBounds = true
        
        symptomsBtn.layer.backgroundColor = UIColor.systemIndigo.cgColor
        symptomsBtn.layer.cornerRadius = 5
        symptomsBtn.layer.masksToBounds = true
//        var dailyCheck = databaseStore.checkEntryComplete(date: dateCheckString)
//        if dailyCheck == true {
//            startBtn.isHidden = true
//        }
        
      //  databaseStore.getAllDates()
        
       
//
        // Do any additional setup after loading the view.
    }
    
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//            //dateForCheck.dateFormat = "dd-MM-yyyy"
//        var check = databaseStore.checkEntryComplete(date: "22-04-2020")
//        if check == true {
//            startBtn.isHidden = true
//            print("worked")
//        }
//
//
//    }
    
    
    
    
    @IBOutlet weak var symptomsBtn: UIButton!
    
    @IBOutlet weak var symptomsView: UIView!
    
    @IBOutlet weak var dailyTxt: UILabel!
    @IBOutlet weak var dailyView: UIView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var dailyQuoteView: UIView!
    
    @IBOutlet weak var dailyEntryView: UIView!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }
   
    
}

