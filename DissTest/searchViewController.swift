//
//  searchViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 31/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class searchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var selectionTxt: UITextField!
    var valueForSearch = ""
    
    @IBOutlet weak var textSearch: UITextField!
    var valueSearched = ""
    var option = ""
    var entries: [Mood] = []
    var database = LogsViewController()
  //  @IBOutlet weak var pickerView: UIPickerView!
    
    
    let cellReuseIdentifier = "searchIdentifier"
    @IBOutlet weak var pickerText: UITextField!
    let options = ["Notes","Water","Exercise","Location","Mood","Stress","Productivity","Sleep","Activities","Alcohol"]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //entries = database.hello.searchEntries(filter: "Location", value: "University")
        
        tableView.delegate = self
        tableView.dataSource = self
        
       // print("Hello")
        let pickerView = UIPickerView()
//               pickerView.delegate = self
//               pickerText.inputView = pickerView
        
        pickerView.delegate = self
        selectionTxt.inputView = pickerView

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func searchBtn(_ sender: Any) {
        //self.viewDidLoad()
        valueSearched = textSearch.text! 
        entries.removeAll()
        entries = database.hello.searchEntries(filter: valueForSearch, value: String(valueSearched))
        self.tableView.reloadData()
        self.viewDidLoad()
       // print(entries[0].Date)
        //print(valueSearched)
        
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
        selectionTxt.text = options[row]
        option = options[row]
        valueForSearch = option
        print(options[row])
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)as! searchTableViewCell
        let wantedDate = entries[indexPath.row].Date
        let wantedMood = entries[indexPath.row].Mood
        let wantedStress = entries[indexPath.row].Stress
        let wantedProductivity = entries[indexPath.row].Productivity
       // let wantedDate = entries[indexPath.row].Date 
        cell.moodValue.text = String(wantedMood)
        cell.stressValue.text = String(wantedStress)
        cell.productivityValue.text = String(wantedProductivity)
        cell.dateValue.text = wantedDate
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                     return 110
             }
    
    
    
   
 
    
       // When user selects an option, this function will set the text of the text field to reflect
       // the selected option.

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "entryDetail" {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let entryDetailVC = segue.destination as! EntryDetailViewController
            
            entryDetailVC.valueForNotes = entries[indexPath.row].Notes
            entryDetailVC.valueForStress = entries[indexPath.row].Stress
            entryDetailVC.valueForMood = entries[indexPath.row].Mood
            entryDetailVC.valueForAlcohol = entries[indexPath.row].Alcohol
            entryDetailVC.valueForWater = entries [indexPath.row].Water
            entryDetailVC.valueForExercise = entries[indexPath.row].Exercise
            entryDetailVC.valueForSleep = entries[indexPath.row].Sleep
            entryDetailVC.valueForProductivity = entries[indexPath.row].Productivity
            entryDetailVC.valueForDate = entries[indexPath.row].Date

        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
        }

}
}
