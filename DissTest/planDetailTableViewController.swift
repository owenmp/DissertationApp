//
//  planDetailTableViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 17/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  Table view which shows plans

import UIKit

class planDetailTableViewController: UITableViewController {
    
    var db = LogsViewController()
    var plan : [ActivityPlan] = []
    var date = ""
   // db.databaseStore.get
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        plan = db.databaseStore.getPlan(date: date)

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
        return plan.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planDetail", for: indexPath)as! planDetailTableViewCell
        let wantedName = plan[indexPath.row].name
        let wantedDescription = plan[indexPath.row].description
        cell.nameLbl.text = wantedName
        cell.descriptionLbl.text = wantedDescription
        let wantedCompletion = plan[indexPath.row].completed
        if wantedCompletion == 1 {
            cell.layer.backgroundColor = UIColor.init(red: 0.894117, green: 0.988235, blue: 0.8, alpha: 1).cgColor
        } else {
            cell.layer.backgroundColor = UIColor.init(red: 0.98823529, green: 0.83921569, blue: 0.8, alpha: 1).cgColor
        }
        

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
               return 108
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
