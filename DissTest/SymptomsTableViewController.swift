//
//  SymptomsTableViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 23/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  Class that shows all the symptoms from todays date.

import UIKit

class SymptomsTableViewController: UITableViewController {
    //database object
       var database = LogsViewController()
    
       //array of symptoms that populates the table view
       var symptoms: [Symptom] = []
       //gets todays date
       var dateString = ""
       let date = Date()
       let dateFormatter = DateFormatter()
    
    //function to run when the screen is opened
    override func viewDidLoad() {
        super.viewDidLoad()
        //Formats todays date to dd-mm-yyy
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateString = dateFormatter.string(from:date)
        
        //allows the cells to have actions
        self.tableView.allowsSelection = true
        
        //populates the table view
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //gets all the symptoms from todays date
        symptoms = database.databaseStore.getSymptoms(date: dateString)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //runs when the view re appears
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    //Updates the array with the latest symptoms added and repopulates the table
    symptoms = database.databaseStore.getSymptoms(date: dateString)
    tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return symptoms.count
    }

    
    //Creates cells with the data from the symptoms array
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "symptomIdentifier", for: indexPath)as! SymptomTableViewCell
        //Sets label value as the relevant data from the array
        let wantedName = symptoms[indexPath.row].Name
        let wantedDrugs = symptoms[indexPath.row].Drugs
        let wantedDescription = symptoms[indexPath.row].Description
        cell.nameLbl.text = wantedName
        cell.descriptionLbl.text = wantedDescription
        cell.drugLbl.text = wantedDrugs

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //sets height of the cel
               return 108
       }
    
    
    //function to allow the cells to be deleted
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        
        //Delete action when the cell is swiped
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete" , handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
        //Menu appears allowing the user to delete
            let deleteMenu = UIAlertController(title: nil, message: "Are you sure you want to delete \(self.symptoms[indexPath.row].Name)", preferredStyle: .actionSheet)
            //deletes cell from table
            let confirmAction = UIAlertAction(title: "Yes", style: .default, handler: {
                action in print("deleted \(self.symptoms[indexPath.row].Name)")
            //deletes symptom from the database
                self.database.databaseStore.deleteSymptom(symptom: self.symptoms[indexPath.row])
                self.symptoms.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                })
            //allows the user to cancel instead of deleting
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
        //adds the actions to the menu
       deleteMenu.addAction(confirmAction)
       deleteMenu.addAction(cancelAction)

       self.present(deleteMenu, animated: true, completion: nil)
        })

        return [deleteAction]
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
