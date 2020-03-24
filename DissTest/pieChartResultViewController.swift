//
//  pieChartResultViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 23/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit
import Charts

class pieChartResultViewController: UIViewController {

    let mood: [String] = ["Sleep","Water","Stress","Exercise","Alcohol","Productivity"]
    //let values = []
    var databaseCall = LogsViewController()
   // var valuesForPie: [Int] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let values = self.databaseCall.hello.getAverages(moodLevel: 3)
        customizeChart(dataPoints: mood, values: values)

        // Do any additional setup after loading the view.
    }
    
    
   
    
    @IBOutlet weak var pie: PieChartView!
    func customizeChart(dataPoints: [String], values: [Int]) {
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count{
            let dataEntry = PieChartDataEntry(value: Double(values[i]), label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
            
        }
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
        // 3. Set ChartData
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        // 4. Assign it to the chart’s data
        pie.data = pieChartData

        
        
    }
    
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
      var colors: [UIColor] = []
      for _ in 0..<numbersOfColor {
        let red = Double(arc4random_uniform(256))
        let green = Double(arc4random_uniform(256))
        let blue = Double(arc4random_uniform(256))
        let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
        colors.append(color)
      }
      return colors
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
