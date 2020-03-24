//
//  EntriesTableViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 24/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit


class EntriesTableViewController: UITableViewController {
    var entries: [Mood] = []
    let database = LogsViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        entries = self.database.hello.getAllEntries()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)as! EntryTableViewCell
        let wantedDate = entries[indexPath.row].Date
        let wantedMood = entries[indexPath.row].Mood
        let wantedStress = entries[indexPath.row].Stress
        let wantedProductiity = entries[indexPath.row].Productivity
        cell.dateLbl.text = wantedDate
        cell.stressValueLbl.text = String(wantedStress)
        cell.productivityValueLbl.text = String(wantedProductiity)
        cell.moodValueLbl.text = String(wantedMood)
       // cell.layer.backgroundColor = UIColor.systemRed.cgColor
        let color = getColourForCell(value: wantedMood)
        cell.layer.backgroundColor = color.cgColor
        
        
        return cell
    }
    
    //let green = UIColor(hex: "#a8edbb")
    
    func getColourForCell(value: Int) -> UIColor {
        let number = value
        switch number {
        case 1 :
            return UIColor.init(red: 1, green: 0.72941176, blue: 0.72941176, alpha: 1)
            case 2:
                return UIColor.init(red: 0.98823529, green: 0.83921569, blue: 0.8, alpha: 1)
            case 3:
                return UIColor.init(red: 0.98823529, green: 0.9911111, blue: 0.90666667, alpha: 1)
            case 4:
                return UIColor.init(red: 0.98823529, green: 0.96470588, blue: 0.8, alpha: 1)
        case 5:
                return UIColor.init(red: 0.97254902, green: 0.98823529, blue: 0.8, alpha: 1)
        case 6:
            return UIColor.init(red: 0.921568, green: 0.98823529, blue: 0.8, alpha: 1)
            case 7:
                return UIColor.init(red: 0.894117, green: 0.988235, blue: 0.8, alpha: 1)
            case 8:
                return UIColor.init(red: 0.854901, green: 0.968627, blue: 0.7843137, alpha: 1)
            case 9:
                return UIColor.init(red: 0.7099, green: 0.9215, blue: 0.74901, alpha: 1)
            case 10:
            return UIColor.init(red: 0.6588, green: 0.9294, blue: 0.737255, alpha: 1)
        default: return UIColor.systemBlue
        }
        
        
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                  return 110
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
