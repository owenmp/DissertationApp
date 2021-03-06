//
//  BarChartViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 31/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  Creates bar charts

import UIKit
import Charts


class BarChartViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    var option = "SleepHours"
    var valueForSearch = "8"
    let options = ["Water","Exercise","Sleep","Location","Alcohol","Activities"]
    var db = LogsViewController()
    var formatter = ChartStringFormatter()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let pickerView = UIPickerView()
        pickerView.delegate = self
        searchTxt.inputView = pickerView
        var y = db.databaseStore.getBarAverages(search: option, value: valueForSearch)
        var x = ["Mood", "Stress", "Productivity"]
       // var y = [1,5,10]
        setChart(dataPoints: x, values: y)
        barChart.autoScaleMinMaxEnabled = true
        barChart.dragEnabled = true
        //formats the legend
        let legend = barChart.legend
        legend.font = UIFont(name:"Verdana", size: 15.0)!
        searchView.layer.cornerRadius = 7
        searchView.layer.masksToBounds = true
        searchView.layer.backgroundColor = UIColor.systemGray6.cgColor
        backgroundView.layer.cornerRadius = 7
        backgroundView.layer.masksToBounds = true
        backgroundView.layer.backgroundColor = UIColor.systemGray6.cgColor
        
        hoursTxt.isHidden = true
        minutesTxt.isHidden = true
        hoursTxt.keyboardType = UIKeyboardType.numberPad
        minutesTxt.keyboardType = UIKeyboardType.numberPad
//        createBtn.layer.cornerRadius = 7
//        createBtn.layer.masksToBounds = true
//        createBtn.layer.backgroundColor = UIColor.white.cgColor
        
       // barChart.animate(yAxisDuration: 3000)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func minutesTxt(_ sender: Any) {
    }
    
    @IBAction func hoursTxt(_ sender: Any) {
    }
    
    @IBOutlet weak var hoursTxt: UITextField!
    
    @IBOutlet weak var minutesTxt: UITextField!
    
    //creates pdf, uses filter and value to name the file
    @IBAction func pdfButton(_ sender: Any) {
        let alert = UIAlertController(title: "PDF", message: "Are you sure you want to save this chart as a PDF?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            action in
            var filename = self.option
            if self.valueTxt.isHidden == false {
            filename += self.valueForSearch
            } else {
                filename += self.hoursTxt.text!
                filename += "Hours"
                filename += self.minutesTxt.text!
                filename += "Minutes"
                
            }
            let pdfFilePath = self.barChart.exportAsPdfFromView(name: filename)
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
            
            valueTxt.text = ""
            hoursTxt.text = ""
            minutesTxt.text = ""
              searchTxt.text = options[row]
              option = options[row]
              valueForSearch = option
            if valueForSearch == "Sleep" || valueForSearch == "Exercise" {
                
                if hoursTxt.isHidden == true {
                hoursTxt.alpha = 0
                minutesTxt.alpha = 0
                    valueTxt.alpha = 1
                    
                    
                    UITextField.animate(withDuration: 0.25, animations: {
                                       self.hoursTxt.alpha = 1
                                       self.minutesTxt.alpha = 1
                                       self.valueTxt.alpha = 0
                                           self.hoursTxt.isHidden = false
                                       self.minutesTxt.isHidden = false
                                       self.valueTxt.isHidden = true
                    })
                    
                    
                
            }
            } else {
                if valueTxt.isHidden == true {
                    hoursTxt.alpha = 1
                    minutesTxt.alpha = 1
                    valueTxt.alpha = 0
                    UITextField.animate(withDuration: 0.25, animations: {
                        self.hoursTxt.alpha = 0
                        self.minutesTxt.alpha = 0
                        self.valueTxt.alpha = 1
                        self.hoursTxt.isHidden = true
                        self.minutesTxt.isHidden = true
                        self.valueTxt.isHidden = false
                    })
                    
                }
                
                if valueForSearch == "Water" || valueForSearch == "Alcohol" {
                    valueTxt.keyboardType = UIKeyboardType.numberPad
                } else {
                    valueTxt.keyboardType = UIKeyboardType.default
                }
                
            
            
            print(option)
    }
    }
    
    
    
    
    @IBAction func createBar(_ sender: Any) {
        
        if valueTxt.isHidden == false {
            
            var types = ["Mood","Stress","Productivity"]
            valueForSearch = valueTxt.text!
            if option == "Activities" {
                var dates = db.databaseStore.getActivityDates(name: valueForSearch)
                var values = db.databaseStore.getBarActivityAverage(dates: dates)
                setChart(dataPoints: types, values: values)
            
                
            } else{
            
            var dataValues = db.databaseStore.getBarAverages(search: option, value: valueForSearch)
            setChart(dataPoints: types, values: dataValues)
            }
        } else {
            
            var types = ["Mood","Stress","Productivity"]
            var hours = hoursTxt.text!
            var minutes = minutesTxt.text!
            var dataValues = db.databaseStore.getBarSleepOrExercise(search: option, hours: hours, minutes: minutes)
            setChart(dataPoints: types, values: dataValues)
            
        }
        
        
//        valueForSearch = valueTxt.text!
//        print(valueForSearch)
//        print(option)
//        var array = ["1","2","3"]
//        var val = [8,3,6]
//        setChart(dataPoints: array , values: val)
       // self.viewDidLoad()
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
