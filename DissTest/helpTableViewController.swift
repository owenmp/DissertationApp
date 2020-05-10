//
//  helpTableViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 10/05/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  Gives user help on how to use the app

import UIKit

class helpTableViewController: UITableViewController {
    
    let sections = ["Mood Tracking", "Symptom Tracking","Activity Plan","Trends","Exporting","Further Support"]
    let help = [["Complete a mood entry every day by filling out your mood and lifestyle details. Break your day down into as many activities as you possibly can.","Entry must be details of the day the entry is being completed. If an entry has been missed, change your date in your phones settings to be able to complete the entry.","View your previous mood entries in the 'Entries' or 'Search' screens found in the trends tab."],["Create symptoms by pressing the symptoms button on the 'Daily Entry' tab, and then by pressing 'Add Symptom' in the top right corner.","If you want to delete a symptom from the table, swipe the symptom from the right, and press 'Delete'.","To view symptoms from previous days, they can be found by pressing the 'Symptoms' button when viewing an entry."],["An activity plan can be made to plan your day. To add a goal for your day, press the 'Add Goal' button in the top right corner.","If you want to set a goal to complete, press the goal and select 'Complete'. The goal should then appear green to indicate that it is complete."],["In the trends tab, you can create chars, view previous entries, or find advice based on your entries.","To create charts, press charts and select the chart you would like. Then, use the options available to create a chart","To filter entries, use the first text box to pick a filter, and then the second text box to search a value.","To see what average values you have entered, use the advice screen to compare your good, bad and average days."],["To export data, use the create PDF button you will find on screens. Copy the filepath to your clipboard, and search that path in your mobiles search box. From here you will able to share the PDF file."],["If you need to speak to anyone regarding negative thoughts, please consider calling: CALM - 0800 58 58 58, Samaritans - 116 123, Anxiety UK - 03444 775 774 "]]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    override func tableView(_  tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
               return sections[section]
       }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rows = help[section]
        return rows.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "help", for: indexPath)as! helpTableViewCell
        let wantedText = help[indexPath.section][indexPath.row]
        cell.textLbl.text = wantedText
        

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
              return 40
      }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
