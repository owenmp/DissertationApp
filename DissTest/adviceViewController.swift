//
//  adviceViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 11/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class adviceViewController: UIViewController {
    var db = LogsViewController()
    var goodWaterAv: Double = 0
    var poorWaterAv : Double = 0
    var mediumWaterAv : Double = 0
    var poorSleepAv: Double = 0
    var goodSleepAv: Double = 0
    var mediumSleepAv: Double = 0
    var mediumAlcoholAv: Double = 0
    var poorAlcoholAv: Double = 0
    var goodAlcoholAv: Double = 0
    var goodExerciseAv: Double = 0
    var mediumExerciseAv: Double = 0
    var poorExerciseAv: Double = 0
    var overallSleep: Double = 0
    var overallExercise: Double = 0
    var overallAlcohol: Double = 0
    var overallWater: Double = 0
    var count = 0
    var exerciseCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        goodWaterAv = db.hello.getGoodAverage()
        poorWaterAv = db.hello.getPoorWaterAverage()
        mediumSleepAv = db.hello.getMediumAverage()
        mediumWaterAv = db.hello.getGoodAverage()
        poorSleepAv = db.hello.getPoorSleepAverage()
        goodSleepAv = db.hello.getGoodSleepAverage()
        mediumSleepAv = db.hello.getMediumSleepAverage()
        mediumAlcoholAv = db.hello.getMediumALCOHOLAverage()
        poorAlcoholAv = db.hello.getPoorAlcoholAverage()
        goodAlcoholAv = db.hello.getGoodAlcoholAverage()
        goodExerciseAv = db.hello.getGoodExerciseAverage()
        mediumExerciseAv = db.hello.getMediumExerciseAverage()
        poorExerciseAv = db.hello.getPoorExerciseAverage()
        overallSleep = db.hello.getOverallSleep()
        overallExercise = db.hello.getOverallExercise()
        overallAlcohol = db.hello.getOverallAlcohol()
        overallWater = db.hello.getOverallWater()
        averageWaterLbl.text = String(format:"%.2f",overallWater)
        averageViewWaterLbl.text = String(format:"%.2f",overallWater)
        exerciseLbl.isHidden = true
        badWaterValLbl.isHidden = true
        badWaterDescLbl.isHidden = true
        badWaterValLbl.text = String(format:"%.2f",poorWaterAv)
        
        
        
        
        waterView.isHidden = true
        // Do any additional setup after loading the view.
        introView.layer.cornerRadius = 7
        introView.layer.masksToBounds = true
        introView.layer.backgroundColor = UIColor.systemGray6.cgColor
        waterView.layer.cornerRadius = 7
               waterView.layer.masksToBounds = true
               waterView.layer.backgroundColor = UIColor.systemGray6.cgColor
        averageLifeView.layer.cornerRadius = 7
        averageLifeView.layer.masksToBounds = true
        averageLifeView.layer.backgroundColor = UIColor.systemGray6.cgColor
        averageLifeView.isHidden = true
        goodWaterDescLbl.isHidden = true
        goodWaterValLbl.isHidden = true
        goodWaterValLbl.text = String(format:"%.2f",goodWaterAv)
        averageExerciseVal.isHidden = true
        averageExerciseVal.text = String(format:"%.2f",overallExercise)
        dailyExerciseValLbl.text = String(format:"%.2f",overallExercise)
        goodExerciseValLbl.text = String(format:"%.2f",goodExerciseAv)
        badExerciseValLbl.text = String(format:"%.2f",poorExerciseAv)
        exerciseView.isHidden = true
        exerciseView.layer.cornerRadius = 7
        exerciseView.layer.masksToBounds = true
        exerciseView.layer.backgroundColor = UIColor.systemGray6.cgColor
        
        badExerciseValLbl.isHidden = true
        badExerciseDescLbl.isHidden = true
        goodExerciseValLbl.isHidden = true
        goodExerciseDescLbl.isHidden = true
        
        
        
    }
    
    
    
    @IBOutlet weak var averageExerciseVal: UILabel!
    
    @IBOutlet weak var badExerciseValLbl: UILabel!
    @IBOutlet weak var goodExerciseValLbl: UILabel!
    @IBOutlet weak var dailyExerciseValLbl: UILabel!
    
    @IBOutlet weak var badExerciseDescLbl: UILabel!
    @IBOutlet weak var goodExerciseDescLbl: UILabel!
    
    @IBOutlet weak var exerciseView: UIView!
    
    
    @IBOutlet weak var badWaterValLbl: UILabel!
    @IBOutlet weak var badWaterDescLbl: UILabel!
    @IBOutlet weak var goodWaterValLbl: UILabel!
    
    @IBOutlet weak var goodWaterDescLbl: UILabel!
    
    @IBOutlet weak var waterNextBtn: UIButton!
    
    @IBOutlet weak var exerciseLbl: UILabel!
    @IBOutlet weak var averageViewWaterLbl: UILabel!
    @IBOutlet weak var averageLifeView: UIView!
    
    @IBOutlet weak var averageWaterLbl: UILabel!
    
    @IBOutlet weak var exerciseNextBtn: UIButton!
    
    
    
    
    @IBAction func exerciseNextBtn(_ sender: Any) {
        exerciseCount += 1
        
        if exerciseCount == 1{
            goodExerciseDescLbl.alpha = 0
            goodExerciseValLbl.alpha = 0
            UILabel.animate(withDuration: 2, animations: {
                self.goodExerciseDescLbl.alpha = 1
                self.goodExerciseDescLbl.isHidden = false
                self.goodExerciseValLbl.alpha = 1
                self.goodExerciseValLbl.isHidden = false
            })
        }else if exerciseCount == 2{
            badExerciseDescLbl.alpha = 0
                       badExerciseValLbl.alpha = 0
                       UILabel.animate(withDuration: 2, animations: {
                           self.badExerciseDescLbl.alpha = 1
                           self.badExerciseDescLbl.isHidden = false
                           self.badExerciseValLbl.alpha = 1
                           self.badExerciseValLbl.isHidden = false
                        self.exerciseNextBtn.setTitle("Next", for: .normal)
            
        })
        
        
        } else {
           // exerciseView.alpha = 1
            UIView.animate(withDuration: 2.0, animations: {
                
                self.exerciseView.alpha = 0
                self.exerciseView.isHidden = true
                
            })
            
        }
    
    }
    
    
    @IBAction func waterNextBtn(_ sender: Any) {
       // waterView.isHidden = true
       // introView.isHidden = false
       
        count += 1
        print(count)
        
        if count == 1{
            goodWaterValLbl.alpha = 0
            goodWaterDescLbl.alpha = 0
            UILabel.animate(withDuration: 2, animations: {
                self.goodWaterValLbl.isHidden = false
                self.goodWaterValLbl.alpha = 1
                self.goodWaterDescLbl.isHidden = false
                self.goodWaterDescLbl.alpha = 1
            })
            
//            self.goodWaterDescLbl.isHidden = false
//            self.goodWaterValLbl.isHidden = false
           // count += 1
            } else if count == 2{
            badWaterValLbl.alpha = 0
            badWaterDescLbl.alpha = 0
            UILabel.animate(withDuration: 2, animations: {
                self.badWaterValLbl.isHidden = false
                self.badWaterValLbl.alpha = 1
                self.badWaterDescLbl.isHidden = false
                self.badWaterDescLbl.alpha = 1
                self.waterNextBtn.setTitle("Next", for: .normal)
                
            })
            
        } else{
            exerciseView.alpha = 0
            UIView.animate(withDuration: 2, animations: {
                self.waterView.alpha = 0
                self.waterView.isHidden = true
                self.exerciseView.alpha = 1
                self.exerciseView.isHidden = false
                
            })
            
            averageExerciseVal.alpha = 0
            exerciseLbl.alpha = 0
            UILabel.animate(withDuration: 2, animations: {
                self.averageExerciseVal.alpha = 1
                self.averageExerciseVal.isHidden = false
                self.exerciseLbl.alpha = 1
                self.exerciseLbl.isHidden = false
                
                
            })
        
        
        
        }
        
        
    }
    
    @IBOutlet weak var waterView: UIView!
    
    @IBAction func testBtn(_ sender: Any) {
       // introView.isHidden = false
        print("but")
        
        exerciseLbl.alpha = 0
        UILabel.animate(withDuration: 2, animations: {
            self.exerciseLbl.isHidden = false
            self.exerciseLbl.alpha = 1
            
        })
       
        
        
        
    }
    @IBAction func nextBtn(_ sender: Any) {
        
        UIView.animate(withDuration: 0.1, animations: {
                   self.introView.alpha = 0
           // self.averageLifeView.alpha = 0
                   
               })
        waterView.alpha = 0
        averageLifeView.alpha = 0
        waterView.isHidden = false
        averageLifeView.isHidden = false
        UIView.animate(withDuration: 2, animations: {
            self.waterView.alpha = 1
            self.averageLifeView.alpha = 1
        })
        
        
        //introView.isHidden = true
       // waterView.isHidden = false
    }
    
    @IBOutlet weak var introView: UIView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
