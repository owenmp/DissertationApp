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
    var option = "Sleep"
    var valueForSearch = "8"
    let options = ["Water","Exercise","Sleep","Location","Alcohol"]
    var db = LogsViewController()
    var formatter = ChartStringFormatter()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let pickerView = UIPickerView()
        pickerView.delegate = self
        searchTxt.inputView = pickerView
        var y = db.hello.getBarAverages(search: option, value: valueForSearch)
        var x = ["Mood", "Stress", "Productivity"]
       // var y = [1,5,10]
        setChart(dataPoints: x, values: y)
        barChart.autoScaleMinMaxEnabled = true
        barChart.dragEnabled = true
        
        let legend = barChart.legend
        legend.font = UIFont(name:"Verdana", size: 15.0)!
        searchView.layer.cornerRadius = 7
        searchView.layer.masksToBounds = true
        searchView.layer.backgroundColor = UIColor.systemGray6.cgColor
        backgroundView.layer.cornerRadius = 7
        backgroundView.layer.masksToBounds = true
        backgroundView.layer.backgroundColor = UIColor.systemGray6.cgColor
//        createBtn.layer.cornerRadius = 7
//        createBtn.layer.masksToBounds = true
//        createBtn.layer.backgroundColor = UIColor.white.cgColor
        
       // barChart.animate(yAxisDuration: 3000)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pdfButton(_ sender: Any) {
        let pdfFilePath = barChart.exportAsPdfFromView()
        print(pdfFilePath)
    }
    
    @IBOutlet weak var createBtn: UIButton!
    
    @IBOutlet weak var backgroundView: UIView!
    
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
    
    
    
    @IBAction func createBar(_ sender: Any) {
        valueForSearch = valueTxt.text!
        print(valueForSearch)
        print(option)
        self.viewDidLoad()
    }
    
    
    @IBOutlet weak var searchView: UIView!
    
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
        barChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
       
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
