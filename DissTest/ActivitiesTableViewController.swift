//
//  ActivitiesTableViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 15/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  Shows all the activities the user can choose

import UIKit

class ActivitiesTableViewController: UITableViewController {
    var valueForName: String = ""
    var valueForDescription: String = ""
    var descriptionString: String = ""
    //let database = DataStoreRebuild()
    var activities: [activity] = []
    var db = LogsViewController()
//    var entryActivities: [activityLog] = []
    
    
    
    
//    @IBAction func refreshBtn(_ sender: Any) {
//        print("Refresh")
//        activities.removeAll()
//        activities = blabla.databaseStore.getActivities()
//        self.tableView.reloadData()
//        self.viewDidLoad()
//       // for i in entryActivities{
//         //   print(i)
//        //}
////        self.tableView.reloadData()
////        self.viewDidLoad()
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewLoaded")
        tableView.allowsSelection = true
     
        activities = db.databaseStore.getActivities()
        //tableView.reloadData()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        createBtn.layer.cornerRadius = 7
        createBtn.layer.masksToBounds = true
        createBtn.layer.backgroundColor = UIColor.systemBlue.cgColor
       // self.tableView.datasource = self
        //tableView.reloadData()
        
    }
    //reloads the table view
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // load datas
        activities = db.databaseStore.getActivities()
    tableView.reloadData()
    }
    
    
    @IBOutlet weak var createBtn: UIButton!
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
  
   
    @IBAction func linkButton(_ sender: Any) {
       // print("hello")
        print(valueForDescription)
        print(valueForName)
        print(valueForDescription)
        print(valueForName)
        print(descriptionString)
        //print("hello")
    }
    
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return activities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityIdentifier", for: indexPath)as! ActivitiesTableViewCell
        let wantedName = activities[indexPath.row].name
        let wantedDescription = activities[indexPath.row].description
        cell.nameLbl.text = wantedName
        cell.descriptionLbl.text = wantedDescription
        
        
        
        

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
               return 110
       }
   
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        print("hello")
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //opens screen to add details about activity to daily entry
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow{ let detailActivityVC = segue.destination as! detailActivityViewController
                detailActivityVC.valueForName = activities [indexPath.row].name
                detailActivityVC.valueForType = activities[indexPath.row].description
            }
        }
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
