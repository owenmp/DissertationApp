//
//  scatterGraphViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 07/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit
import Charts

class scatterGraphViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var option = ""
    var valueForSearch = ""
    let options = ["Water","Exercise","Location","Stress","Productivity","Sleep","Alcohol"]
    var db = LogsViewController()
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let pickerView = UIPickerView()
        pickerView.delegate = self
        searchTxt.inputView = pickerView
        scatterChart.noDataText = "No data"
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let data = db.hello.getScatterData(filter: "Sleep", value: 8)
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
//        setChart(dataPoints: data[0].Date, values: data[0].Sleep)
        
        let dates = db.hello.getScatterDates(filter: "Sleep", value: 8)
        let values = db.hello.getScatterData(filter: "Sleep", value: 8)
        setChart(dataPoints: dates, values: values)
        scatterChart.autoScaleMinMaxEnabled = true
        scatterChart.setVisibleXRange(minXRange: 1, maxXRange: 10)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func searchTxt(_ sender: Any) {
    }
    
    @IBOutlet weak var searchTxt: UITextField!
    
    
    
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
            db.hello.getScatterData(filter: valueForSearch, value: 8)
        
           print(options[row])
       }
    
    
    @IBOutlet weak var scatterChart: ScatterChartView!
    
    
    func setChart(dataPoints: [String], values: [Int]){
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(values[i]), y: Double(i))
           // let dataEntry = ChartDataEntry(x: , y: <#T##Double#>)
            dataEntries.append(dataEntry)
            }
        
        let chartDataSet = ScatterChartDataSet(entries: dataEntries, label: "Mood Value")
    
        
        let chartData = ScatterChartData(dataSet: chartDataSet)
        
        //scatterChart.setAutoSc

        scatterChart.data = chartData
        scatterChart.dragEnabled = true
       // scatterChart.setVisibleXRange(minXRange: 1, maxXRange: 10)
        
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
