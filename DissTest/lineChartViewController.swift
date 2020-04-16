//
//  lineChartViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 14/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit
import Charts

class lineChartViewController: UIViewController {
    
    var db = LogsViewController()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var data = db.databaseStore.getAllDates()
        
        var vals = db.databaseStore.getAllMood()
        
        
        
        setChart(dataPoints: data, values: vals)
        

        // Do any additional setup after loading the view.
    }
    
    func setChart (dataPoints: [String], values:[Int]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(values[i]), y: Double(i))
            dataEntries.append(dataEntry)
        }
        
        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label:nil)
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChart.data = lineChartData
        
    
    
    
    }
    
    @IBOutlet weak var lineChart: LineChartView!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
