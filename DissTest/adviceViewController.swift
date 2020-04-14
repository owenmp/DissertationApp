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
    var alcoholCount = 0
    var sleepCount = 0

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
        alcoholView.isHidden = true
        alcoholView.layer.cornerRadius = 7
        alcoholView.layer.masksToBounds = true
        alcoholView.layer.backgroundColor = UIColor.systemGray6.cgColor
        badAlcoholValLbl.isHidden = true
        badAlcoholDescLbl.isHidden = true
        goodAlcoholValLbl.isHidden = true
        goodAlcoholDescLbl.isHidden = true
        goodAlcoholValLbl.text = String(format:"%.2f",goodAlcoholAv)
        badAlcoholValLbl.text = String(format:"%.2f",poorAlcoholAv)
        alcoholLifeLbl.isHidden = true
        
        alcoholLifeValLbl.isHidden = true
        alcoholLifeValLbl.text = String(format:"%.2f",overallAlcohol)
        avAlcoholDescLbl.isHidden = true
        avAlcoholValLbl.isHidden = true
        avAlcoholValLbl.text = String(format:"%.2f",overallAlcohol)
        sleepLifeLbl.isHidden = true
        sleepLifeValLbl.isHidden = true
        sleepLifeValLbl.text = String(format:"%.2f",overallSleep)
        
        sleepView.isHidden = true
        sleepView.layer.cornerRadius = 7
        sleepView.layer.masksToBounds = true
        sleepView.layer.backgroundColor = UIColor.systemGray6.cgColor
        goodSleepDescLbl.isHidden = true
        goodSleepValLbl.isHidden = true
        badSleepValLbl.isHidden = true
        badSleepDescLbl.isHidden = true
        goodSleepValLbl.text = String(format:"%.2f",goodSleepAv)
        badSleepValLbl.text = String(format:"%.2f",poorSleepAv)
        avSleepVal.text = String(format:"%.2f",overallSleep)
        goodLifestyleView.isHidden = true
        goodLifestyleView.layer.cornerRadius = 7
        goodLifestyleView.layer.masksToBounds = true
        goodLifestyleView.layer.backgroundColor = UIColor.init(red: 0.6588, green: 0.9294, blue: 0.737255, alpha: 1).cgColor
        
        goodSleepLifeLbl.text = String(format:"%.2f",goodSleepAv)
        goodAlcoholLifeLbl.text = String(format:"%.2f",goodAlcoholAv)
        goodExerciseLifeLbl.text = String(format:"%.2f",goodExerciseAv)
        goodLifeWaterLbl.text = String(format:"%.2f",goodWaterAv)
        
        
        pdfBtn.isHidden = true
        pdfBtn.layer.backgroundColor = UIColor.systemRed.cgColor
        pdfBtn.layer.cornerRadius = 7
        pdfBtn.layer.masksToBounds = true
        statsBtn.isHidden = true
        statsBtn.layer.backgroundColor = UIColor.systemIndigo.cgColor
        statsBtn.layer.cornerRadius = 7
        statsBtn.layer.masksToBounds = true
        backGroundView.isHidden = false
        
    }
    
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var pdfBtn: UIButton!
    
    @IBOutlet weak var statsBtn: UIButton!
    
    
    
    @IBOutlet weak var goodSleepLifeLbl: UILabel!
    @IBOutlet weak var goodAlcoholLifeLbl: UILabel!
    @IBOutlet weak var goodExerciseLifeLbl: UILabel!
    
    @IBOutlet weak var goodLifeWaterLbl: UILabel!
    
    
    
    @IBOutlet weak var goodLifestyleView: UIView!
    
    
    @IBOutlet weak var avSleepVal: UILabel!
    
    @IBOutlet weak var sleepNextBtn: UIButton!
    
    
    @IBOutlet weak var badSleepValLbl: UILabel!
    @IBOutlet weak var badSleepDescLbl: UILabel!
    
    @IBOutlet weak var goodSleepValLbl: UILabel!
    
    @IBOutlet weak var goodSleepDescLbl: UILabel!
    
    @IBOutlet weak var sleepView: UIView!
    
    
    @IBOutlet weak var sleepLifeValLbl: UILabel!
    @IBOutlet weak var sleepLifeLbl: UILabel!
    
    @IBOutlet weak var avAlcoholValLbl: UILabel!
    
    @IBOutlet weak var avAlcoholDescLbl: UILabel!
    
    @IBOutlet weak var alcoholLifeValLbl: UILabel!
    
    @IBOutlet weak var alcoholLifeLbl: UILabel!
    
    
    @IBOutlet weak var badAlcoholValLbl: UILabel!
    
    @IBOutlet weak var goodAlcoholValLbl: UILabel!
    @IBOutlet weak var badAlcoholDescLbl: UILabel!
    
    @IBOutlet weak var goodAlcoholDescLbl: UILabel!
    
    @IBOutlet weak var averageAlcoholLbl: UILabel!
    
    @IBOutlet weak var alcoholView: UIView!
    
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
    
    @IBOutlet weak var alcoholNextBtn: UIButton!
    
    
    @IBAction func pdfBtn(_ sender: Any) {
        
        let pdfFilePath = backGroundView.exportAsPdfFromView()
               print(pdfFilePath)
        
    }
    
    @IBAction func sleepNextBtn(_ sender: Any) {
        
        sleepCount += 1
        
        if sleepCount == 1 {
            
            goodSleepDescLbl.alpha = 0
            goodSleepValLbl.alpha = 0
            UILabel.animate(withDuration: 2, animations: {
                self.goodSleepValLbl.alpha = 1
                self.goodSleepDescLbl.alpha = 1
                self.goodSleepValLbl.isHidden = false
                self.goodSleepDescLbl.isHidden = false
                
            })
        }else if sleepCount == 2 {
            
            badSleepDescLbl.alpha = 0
            badSleepValLbl.alpha = 0
            UILabel.animate(withDuration: 2, animations: {
                self.badSleepDescLbl.alpha = 1
                self.badSleepDescLbl.isHidden = false
                self.badSleepValLbl.alpha = 1
                self.badSleepValLbl.isHidden = false
                self.sleepNextBtn.setTitle("Next", for: .normal)
                
                
                
            })
        }else {
            
            sleepView.alpha = 1
            goodLifestyleView.alpha = 0
            pdfBtn.alpha = 0
            statsBtn.alpha = 0
           
            UIView.animate(withDuration: 2, animations: {
                self.sleepView.alpha = 0
                self.goodLifestyleView.alpha = 1
                self.goodLifestyleView.isHidden = false
                self.pdfBtn.alpha = 1
                self.pdfBtn.isHidden = false
                self.statsBtn.alpha = 1
                self.statsBtn.isHidden = false
                self.backGroundView.isHidden = false
                
            })
            
            
            
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func alcoholNextBtn(_ sender: Any) {
        alcoholCount += 1
        
        if alcoholCount == 1 {
            
            goodAlcoholDescLbl.alpha = 0
            goodAlcoholValLbl.alpha = 0
            UILabel.animate(withDuration: 2, animations: {
                
                self.goodAlcoholDescLbl.alpha = 1
                self.goodAlcoholValLbl.isHidden = false
                self.goodAlcoholValLbl.alpha = 1
                self.goodAlcoholDescLbl.isHidden = false
            })
        }else if alcoholCount == 2 {
            
            self.badAlcoholDescLbl.alpha = 0
            self.badAlcoholValLbl.alpha = 0
             UILabel.animate(withDuration: 2, animations: {
                self.badAlcoholDescLbl.alpha = 1
                self.badAlcoholValLbl.alpha = 1
                self.badAlcoholValLbl.isHidden = false
                self.badAlcoholDescLbl.isHidden = false
                
                self.alcoholNextBtn.setTitle("Next", for: .normal)
                
            })
            
        }else {
            alcoholView.alpha = 1
            sleepView.alpha = 0
            UIView.animate(withDuration: 2.0, animations: {
                self.sleepView.alpha = 1
                self.sleepView.isHidden = false
                self.alcoholView.alpha = 0
            self.alcoholView.isHidden = true
            })
            
            sleepLifeValLbl.alpha = 0
            sleepLifeLbl.alpha = 0
            UILabel.animate(withDuration: 2.0, animations: {
                self.sleepLifeValLbl.alpha = 1
                self.sleepLifeLbl.alpha = 1
                self.sleepLifeValLbl.isHidden = false
                self.sleepLifeLbl.isHidden = false
                
            })
            
            
            
            
        }
    }
    
   
    
    
    
    
    
    
    
    
    
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
            alcoholView.alpha = 0
            UIView.animate(withDuration: 2.0, animations: {
                
                self.exerciseView.alpha = 0
                self.exerciseView.isHidden = true
                self.alcoholView.alpha = 1
                self.alcoholView.isHidden = false
                
            })
            
            alcoholLifeValLbl.alpha = 0
            alcoholLifeLbl.alpha = 0
            avAlcoholValLbl.alpha = 0
            avAlcoholDescLbl.alpha = 0
            UILabel.animate(withDuration: 2.0, animations: {
                
                self.alcoholLifeValLbl.alpha = 1
                self.alcoholLifeValLbl.isHidden = false
                self.alcoholLifeLbl.alpha = 1
                self.alcoholLifeLbl.isHidden = false
                self.avAlcoholValLbl.alpha = 1
                self.avAlcoholValLbl.isHidden = false
                self.avAlcoholDescLbl.alpha = 1
                self.avAlcoholDescLbl.isHidden = false
                
                
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
