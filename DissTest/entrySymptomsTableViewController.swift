//
//  entrySymptomsTableViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 23/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  Shows symptoms from previous days

import UIKit

class entrySymptomsTableViewController: UITableViewController {
    var database = LogsViewController()
    var symptoms: [Symptom] = []
    var dateString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        symptoms = database.databaseStore.getSymptoms(date: dateString)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // load datas
        symptoms = database.databaseStore.getSymptoms(date: dateString)
    tableView.reloadData()
    }
    
     override func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
           return 1
       }

       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // #warning Incomplete implementation, return the number of rows
           return symptoms.count
       }

       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "symptomIdentifier", for: indexPath)as! SymptomTableViewCell
           let wantedName = symptoms[indexPath.row].Name
           let wantedDrugs = symptoms[indexPath.row].Drugs
           let wantedDescription = symptoms[indexPath.row].Description
           cell.nameLbl.text = wantedName
           cell.descriptionLbl.text = wantedDescription
           cell.drugLbl.text = wantedDrugs

           // Configure the cell...

           return cell
       }
       
       override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                  return 108
          }
       

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
