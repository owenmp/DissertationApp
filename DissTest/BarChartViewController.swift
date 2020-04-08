//
//  BarChartViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 31/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit
import Charts


class BarChartViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    var option = ""
    var valueForSearch = ""
    let options = ["Water","Exercise","Sleep","Location","Alcohol"]
    var db = LogsViewController()
    var formatter = ChartStringFormatter()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let pickerView = UIPickerView()
        pickerView.delegate = self
        searchTxt.inputView = pickerView
        
        var x = ["Mood", "Stress", "Productivity"]
        var y = [1,5,10]
        setChart(dataPoints: x, values: y)
        barChart.autoScaleMinMaxEnabled = true
        barChart.dragEnabled = true
        
        let legend = barChart.legend
        legend.font = UIFont(name:"Verdana", size: 15.0)!
        
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
              return 1
          }
          
          func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
              return options.count
          }
          
          func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
              return options[row]
          }
          
          func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
              searchTxt.text = options[row]
              option = options[row]
              valueForSearch = option
            print(option)
    }
    
    
    @IBOutlet weak var valueTxt: UITextField!
    @IBOutlet weak var searchTxt: UITextField!
    
    @IBAction func valueTxt(_ sender: Any) {
    }
    @IBAction func searchTxt(_ sender: Any) {
    }
    
    @IBOutlet weak var barChart: BarChartView!
    
    func setChart(dataPoints: [String], values: [Int]){
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
            dataEntries.append(dataEntry)
        }
        
        let barChartDataSet = BarChartDataSet(entries: dataEntries, label: "Mood/Stress/Prodcutivity")
        barChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
        let chartData = BarChartData(dataSet: barChartDataSet)
        barChart.data = chartData
        barChart.xAxis.valueFormatter = formatter
        barChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        barChart.drawBordersEnabled = false
        let format = NumberFormatter()
        format.numberStyle = .none
       let f = DefaultValueFormatter(formatter: format)
        chartData.setValueFormatter(f)
       
    }
    
    
    
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
    var colors: [UIColor] = []
    for _ in 0..<numbersOfColor {
        colors.append(UIColor.green)
        colors.append(UIColor.blue)
        colors.append(UIColor.red)
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
