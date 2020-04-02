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
    var valueForPie = 0
    
   // var valuesForPie: [Int] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //pie.animate(xAxisDuration: 3000)
        //pie.animate(yAxisDuration: 3000)
     //   pie.animate(xAxisDuration: 3000, easing: ChartEasingOption.easeInCirc.self)
        //pie.animate(xAxisDuration: 5000, easingOption: ChartEasingOption.easeInBack)
       // pie.spin(duration: 3000, fromAngle: 500, toAngle: 360)
       // pie.spin(duration: 3000, fromAngle: 500, toAngle: 360)
                moodValueLbl.text = String(valueForPie)
        pie.layer.backgroundColor = UIColor.systemGray6.cgColor
        valueView.layer.backgroundColor = UIColor.systemGray6.cgColor
        valueView.layer.cornerRadius = 7
        valueView.layer.masksToBounds = true
        valueView.layer.shadowRadius = 3
        valueView.layer.shadowOffset = .zero
        pie.layer.cornerRadius = 7
        pie.layer.masksToBounds = true
        pie.layer.shadowRadius = 3
        pie.layer.shadowOffset = .zero
        //pie.layer.
        let legend = pie.legend
        
        
        
         
        legend.font = UIFont(name: "Verdana", size: 25.0)!
        let values = self.databaseCall.hello.getAveragesForMood3(moodLevel: valueForPie)
        customizeChart(dataPoints: mood, values: values)
        

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var valueView: UIView!
    
    
    @IBOutlet weak var moodValueLbl: UILabel!
    
   
    @IBAction func oneBtn(_ sender: Any) {
        valueForPie = 1
        self.viewDidLoad()
    }
    
    
    @IBAction func twoBtn(_ sender: Any) {
        valueForPie = 2
        self.viewDidLoad()
    }
    
    @IBAction func threeBtn(_ sender: Any) {
        valueForPie = 3
        self.viewDidLoad()
    }
    
    
    @IBAction func fourBtn(_ sender: Any) {
        valueForPie = 4
        self.viewDidLoad()
    }
    
    @IBAction func fiveBtn(_ sender: Any) {
        valueForPie = 5
        self.viewDidLoad()
        
    }
    
    @IBAction func sixBtn(_ sender: Any) {
        valueForPie = 6
        self.viewDidLoad()
    }
    
    
    @IBAction func sevenBtn(_ sender: Any) {
        valueForPie = 7
        self.viewDidLoad()
    }
    
    
    @IBAction func eightBtn(_ sender: Any) {
        valueForPie = 8
        self.viewDidLoad()
    }
    
    
    @IBAction func nineBtn(_ sender: Any) {
        valueForPie = 9
        self.viewDidLoad()
    }
    
    
    @IBAction func tenBtn(_ sender: Any) {
        valueForPie = 10
        self.viewDidLoad()
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
        
//        let red = Double(arc4random_uniform(256))
//        let green = Double(arc4random_uniform(256))
//        let blue = Double(arc4random_uniform(256))
//        let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
//        colors.append(color)
        colors.append(UIColor.red)
        colors.append(UIColor.yellow)
        colors.append(UIColor.green)
        colors.append(UIColor.blue)
        colors.append(UIColor.systemPink)
        colors.append(UIColor.purple)
        
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
