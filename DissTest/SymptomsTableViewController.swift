//
//  SymptomsTableViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 23/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class SymptomsTableViewController: UITableViewController {
    var database = LogsViewController()
       var symptoms: [Symptom] = []
       var dateString = ""
       let date = Date()
       let dateFormatter = DateFormatter()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateString = dateFormatter.string(from:date)
        self.tableView.allowsSelection = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        symptoms = database.databaseStore.getSymptoms(date: dateString)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // load datas
        symptoms = database.databaseStore.getSymptoms(date: dateString)
    tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

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
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        
      
        
//        // 1
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete" , handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
//        // 2
            let deleteMenu = UIAlertController(title: nil, message: "Are you sure you want to delete \(self.symptoms[indexPath.row].Name)", preferredStyle: .actionSheet)
//
            let confirmAction = UIAlertAction(title: "Yes", style: .default, handler: {
                action in print("deleted \(self.symptoms[indexPath.row].Name)")
                
                self.database.databaseStore.deleteSymptom(symptom: self.symptoms[indexPath.row])
                self.symptoms.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                
                
                
                })
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            
            

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
