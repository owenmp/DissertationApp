//
//  chartsViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 23/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit
import Charts

class chartsViewController: UIViewController {
    var months: [String]!
    var blabla = LogsViewController()
   

    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.navigationBar.prefersLargeTitles = false
        barChartView.noDataText = "Unlucky mate, no data for you"
       
      //  print(values[0])
        //print(values[1])

        // Do any additional setup after loading the view.
        let water = [1,2,3,4,5]
        let mood = [5,8,9,4,3]
        setChart(dataPoint: water, values: mood)
        
    }
   // let values = blabla.hello.getWater()

    @IBOutlet weak var barChartView: BarChartView!
    func setChart(dataPoint:[Int], values:[Int]){
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoint.count {
            let dataEntry = BarChartDataEntry(x: Double(values[i]), y: Double(dataPoint[i]))
            dataEntries.append(dataEntry)
            
        }
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Water")
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
        
        
        
    }
    
    
    
    

    
    //@IBOutlet weak var barChartsView: BarChartsView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
