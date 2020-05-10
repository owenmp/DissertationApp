//
//  todaysPlanTableViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 17/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  Screen to show todays goals

import UIKit

class todaysPlanTableViewController: UITableViewController {
    var database = LogsViewController()
    var plan: [ActivityPlan] = []
    var dateString = ""
    let date = Date()
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        //print("Loaded")
        //formats todays date
        dateFormatter.dateFormat = "dd-MM-yyyy"
               dateString = dateFormatter.string(from:date)
        
        plan = database.databaseStore.getPlan(date: dateString)
        //allows actions for the table cells
        self.tableView.allowsSelection = true
        //populates table view
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    //runs when view appears, updates table view
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       // load datas
           plan = database.databaseStore.getPlan(date: dateString)
       tableView.reloadData()
       }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //sets number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return plan.count
    }

    
    //populates table view with cells
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todaysPlan", for: indexPath)as! todaysPlanTableViewCell
        let wantedName = plan[indexPath.row].name
        let wantedDescription = plan[indexPath.row].description
        cell.nameLbl.text = wantedName
        cell.descriptionLbl.text = wantedDescription
        let wantedCompletion = plan[indexPath.row].completed
        if wantedCompletion == 1 {
            //colour used to show whether goal is complete or not
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
    
    //Action to allow setting a goal as complete
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        if plan[indexPath.row].completed == 0 {
        
            //Alert pops up when a cell is pressed.
        let alert = UIAlertController(title: "Confirmation", message: "Do you want to set \(plan[indexPath.row].name) as complete?", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
                action in self.database.databaseStore.setCompleteGoal(goal: self.plan[indexPath.row])
                self.plan.removeAll()
                self.plan = self.database.databaseStore.getPlan(date: self.dateString)
                self.tableView.reloadData()
                
                
               }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert,animated: true)
        } else if plan[indexPath.row].completed == 1 {
            
             let alert = UIAlertController(title: "Confirmation", message: "Do you want to set \(plan[indexPath.row].name) as incomplete?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
                action in self.database.databaseStore.setIncompleteGoal(goal: self.plan[indexPath.row])
                self.plan.removeAll()
                self.plan = self.self.database.databaseStore.getPlan(date: self.dateString)
                self.tableView.reloadData()
                
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            self.present(alert,animated: true)
            
            
            
            
            
        }
    
        
        
        //print(plan[indexPath.row].name)
    }
    
    //Allows deletion of rows in the table view.
        override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
        {
            
          
            
    //        // 1
            let deleteAction = UITableViewRowAction(style: .default, title: "Delete" , handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
    //        // 2
                let deleteMenu = UIAlertController(title: nil, message: "Are you sure you want to delete \(self.plan[indexPath.row].name)", preferredStyle: .actionSheet)
    //
                let confirmAction = UIAlertAction(title: "Yes", style: .default, handler: {
                    action in print("deleted \(self.plan[indexPath.row].name)")
                    
                    self.database.databaseStore.deleteGoal(goal: self.plan[indexPath.row])
                    self.plan.remove(at: indexPath.row)
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
