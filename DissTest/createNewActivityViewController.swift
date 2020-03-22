//
//  createNewActivityViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 15/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class createNewActivityViewController: UIViewController {
    var valueForName : String = ""
    var valueForDescription : String = "Des"
    var descriptionSend: String = "Hello"
    
   
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    
    
   
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBAction func nameTxt(_ sender: Any) {
        var text: String = nameTxt.text!
        valueForName = text
     
    }
    
    @IBOutlet weak var descriptionTxt: UITextField!
    @IBAction func descriptionTxt(_ sender: Any) {
        var description: String = descriptionTxt.text!
        valueForDescription = description
    }
    
    
    @IBAction func createBtn(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToVC1", sender: self)
        //navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissVC(_ sender: Any) {
        if let presenter = presentingViewController as? ActivitiesTableViewController {
            print(valueForName)
            print(valueForDescription)
            print(descriptionTxt.text!)
            presenter.valueForName = valueForName
            presenter.valueForDescription = valueForDescription
           
            
        }
        dismiss(animated: true, completion: nil)
        
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
