//
//  pieChartResultViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 23/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  Creates pie charts

import UIKit
import Charts

class pieChartResultViewController: UIViewController {

    let mood: [String] = ["Sleep","Water","Stress","Exercise","Alcohol","Productivity"]
    //let values = []
    var databaseCall = LogsViewController()
    var valueForPie = 1
    
   // var valuesForPie: [Int] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Formats chart
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
        pie.holeRadiusPercent = 0
        pie.transparentCircleRadiusPercent = 0
        
        
        
         
        legend.font = UIFont(name: "Verdana", size: 25.0)!
        let values = self.databaseCall.databaseStore.getAveragesForMood3(moodLevel: valueForPie)
        customizeChart(dataPoints: mood, values: values)
        

        // Do any additional setup after loading the view.
    }
    
    //creates pdf
    @IBAction func createPdfBtn(_
    sender: Any) {
        
        let alert = UIAlertController(title: "PDF", message: "Are you sure you want to save this chart as a PDF?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            action in
            var filename = "MoodValue"
            filename += String(self.valueForPie)
            let pdfFilePath = self.pie.exportAsPdfFromView(name: filename)
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
    
    
    
    @IBOutlet weak var valueView: UIView!
    
    
    @IBOutlet weak var moodValueLbl: UILabel!
    
   //functions redraw the pie chart
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
    
    
   
   //sets pie chart data
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
        pie.animate(yAxisDuration: 1.5)

        

        
    }
    //colours the chart
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
      var colors: [UIColor] = []
      for _ in 0..<numbersOfColor {
        
       // Double(arc4random_uniform(256))
        
//        let red = Double(arc4random_uniform(256))
//        let green = Double(arc4random_uniform(256))
//        let blue = Double(arc4random_uniform(256))
//        let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
//        colors.append(color)
        colors.append(getColourForCell(value: 6))
        colors.append(getColourForCell(value: 1))
        colors.append(getColourForCell(value: 5))
        colors.append(getColourForCell(value: 4))
        colors.append(getColourForCell(value: 8))
        colors.append(getColourForCell(value: 10))
        
      }
      return colors
    }
    
    //gets colour for each slice
    func getColourForCell(value: Int) -> UIColor {
          let number = value
          switch number {
          case 1 :
            return UIColor.init(red: 0.521569, green: 0.03921, blue: 0.003921, alpha: 1)
              case 2:
                  return UIColor.init(red: 0.98823529, green: 0.83921569, blue: 0.8, alpha: 1)
              case 3:
                  return UIColor.init(red: 0.98823529, green: 0.9911111, blue: 0.90666667, alpha: 1)
              case 4:
                return UIColor.init(red: 0.011765, green: 0.0039216, blue: 0.3686274, alpha: 1)
          case 5:
                  return UIColor.init(red: 0.365, green: 0.6353, blue: 0.8235, alpha: 1)
          case 6:
              return UIColor.init(red: 0.36863, green: 0.823529, blue: 0.5804, alpha: 1)
              case 7:
                  return UIColor.init(red: 0.894117, green: 0.988235, blue: 0.8, alpha: 1)
              case 8:
                return UIColor.init(red: 0.07056, green: 0.30980, blue: 0.003922, alpha: 1)
              case 9:
                  return UIColor.init(red: 0.7099, green: 0.9215, blue: 0.74901, alpha: 1)
              case 10:
              return UIColor.init(red: 0.03922, green: 0.30981, blue: 0.278431, alpha: 1)
          default: return UIColor.systemBlue
          }
          
          
          
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
