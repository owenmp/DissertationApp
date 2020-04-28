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
    
    var vals : [Int] = []
    var formatter = ChartStringFormatter()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var data = db.databaseStore.getAllDates()
        
         vals = db.databaseStore.getAllMood()
        
        var averageWeekMood : [Int] = []
        
       
          
            
            
        var averageMoods = getAverageMoods()
        var dates = getAverageDates()
        
        
        setChart(dataPoints: dates, values: averageMoods)
        lineChart.dragEnabled = true
        lineChart.xAxis.labelHeight = 20.0
        lineChart.xAxis.labelWidth = 20.0
        backGroundView.layer.cornerRadius = 7
        backGroundView.layer.masksToBounds = true
        backGroundView.layer.backgroundColor = UIColor.systemGray6.cgColor
        topView.layer.backgroundColor = UIColor.systemGray6.cgColor
        topView.layer.cornerRadius = 7
        topView.layer.masksToBounds = true
        

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var backGroundView: UIView!
    
    func getAverageMoods () -> [Int]{
        var i = 0
        var count = 0
        var week : [Int] = []
        var overall = 0
        var valuesForCheck = db.databaseStore.getAllMood()
        var val = 0
        while i < valuesForCheck.count {
            var val = valuesForCheck[i]
             overall += val
            count += 1
            i += 1
            if count == 7 {
                overall /= 7
                week.append(overall)
                count = 0
            }
    
        }
         return week
    }
    func getAverageDates () -> [String]{
          var i = 0
          var count = 0
          var week : [String] = []
          var overall = 0
          var valuesForCheck = db.databaseStore.getAllDates()
          var val = 0
          while i < valuesForCheck.count {
              var val = valuesForCheck[i]
               //overall += val
              count += 1
              i += 1
              if count == 7 {
                //  overall /= 7
                  week.append(val)
                  count = 0
              }
      
          }
           return week
      }
    
    
    
    
    @IBAction func pdfButton(_ sender: Any) {
        let alert = UIAlertController(title: "PDF", message: "Are you sure you want to save this chart as a PDF?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            action in
            let pdfFilePath = self.lineChart.exportAsPdfFromView()
            print(pdfFilePath)
            
            let secondAlert = UIAlertController(title: "Confirmed", message: "Chart saved to \(pdfFilePath)", preferredStyle: .alert)
            secondAlert.addAction(UIAlertAction(title: "Copy to clipboard", style: .default, handler: {
                action in
                UIPasteboard.general.string = pdfFilePath
            }))
            self.present(secondAlert,animated: true)
            
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert,animated: true)
    }
    
   
    
    
    
    func setChart (dataPoints: [String], values:[Int]) {
        var dataEntries: [ChartDataEntry] = []
      //  var i = 0
        for i in 0..<dataPoints.count {

            let dataEntry = ChartDataEntry(x:Double(i) , y:Double(values[i]))
            dataEntries.append(dataEntry)
            //i += 7
        }
//        while i <= dataPoints.count {
//             let dataEntry = ChartDataEntry(x: Double(values[i]), y: Double(i))
//                        dataEntries.append(dataEntry)
//                        i += 7
//        }
//
        
      //  dataEntries.sort(by: {$0.x < $1.x})
        
        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label:"Mood")
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChart.data = lineChartData
        
    
        lineChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        lineChart.drawBordersEnabled = false
    
        let format = NumberFormatter()
         format.numberStyle = .none
        let f = DefaultValueFormatter(formatter: format)
        lineChartData.setValueFormatter(f)
        //lineChart.xAxis.valueFormatter = formatter
        
        lineChartDataSet.mode = .cubicBezier
        //lineChart.backgroundColor = UIColor.blue
        lineChart.rightAxis.enabled = false
        let yAxis = lineChart.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.axisMinimum = 1
        yAxis.axisMaximum = 10
        yAxis.axisLineColor = .white
        let xAxis = lineChart.xAxis
        xAxis.axisMinimum = 1
        xAxis.axisMaximum = Double(dataPoints.count)
        //xAxis.axisRange = Double(dataPoints.count)
        xAxis.labelFont = .boldSystemFont(ofSize: 12)
      //  xAxis.axisLineColor = .systemBlue
        lineChart.animate(xAxisDuration: 0.8)
        lineChartDataSet.drawCirclesEnabled = false
        //lineChart.xAxis.axisLineWidth = 5.0
        lineChartDataSet.lineWidth = 3.0
        lineChartDataSet.fill = Fill(color: .systemBlue)
        lineChart.drawGridBackgroundEnabled = false
        lineChartDataSet.fillAlpha = 0.8
        lineChartDataSet.drawFilledEnabled = true
        lineChartDataSet.setColor(.black)
        lineChartDataSet.setCircleColor(.white)
        lineChart.gridBackgroundColor = .white
        
        
       // lineChartDataSet.
        
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
