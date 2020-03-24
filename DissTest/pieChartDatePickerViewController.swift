//
//  pieChartDatePickerViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 23/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class pieChartDatePickerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var startDate: UIDatePicker!
    
    
    
    @IBAction func startDate(_ sender: Any) {
        
        let dateFormatter = DateFormatter()

           dateFormatter.dateStyle = DateFormatter.Style.short
           dateFormatter.timeStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: startDate.date)
    }
    
 

  
    @IBOutlet weak var endDate: UIDatePicker!
    
    @IBAction func next(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let strDate = dateFormatter.string(from: startDate.date)
        let endDateStr = dateFormatter.string(from:endDate.date)
        print(strDate)
        print(endDateStr)
        
        
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
