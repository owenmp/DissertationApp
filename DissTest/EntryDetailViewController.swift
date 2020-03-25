//
//  EntryDetailViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 25/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    var valueForNotes = ""
    var valueForMood = 0
    var valueForStress = 0
    var valueForWater = 0
    var valueForSleep = 0
    var valueForExercise = 0
    var valueForAlcohol = 0
    var valueForProductivity = 0
    var valueForDate = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = valueForDate
        moodValueLbl.text = String(valueForMood)
        alcoholValueLbl.text = String(valueForAlcohol)
        productivityValueLbl.text = String(valueForProductivity)
        waterValueLbl.text = String(valueForWater)
        sleepValueLbl.text = String(valueForSleep)
        exerciseValueLbl.text = String(valueForExercise)
        notesLbl.text = valueForNotes
        stressValueLbl.text = String(valueForStress)
        

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var notesLbl: UILabel!
    @IBOutlet weak var alcoholValueLbl: UILabel!
    @IBOutlet weak var exerciseValueLbl: UILabel!
    @IBOutlet weak var sleepValueLbl: UILabel!
    
    @IBOutlet weak var waterValueLbl: UILabel!
    
    @IBOutlet weak var stressValueLbl: UILabel!
    @IBOutlet weak var moodValueLbl: UILabel!
    
    @IBOutlet weak var productivityValueLbl: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
