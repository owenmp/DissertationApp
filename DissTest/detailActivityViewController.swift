//
//  detailActivityViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 06/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  Allows the user to enter an activity to their entry

import UIKit

class detailActivityViewController: UIViewController {
    //fields used to create an activity log
    var valueForName = ""
    var valueForType = ""
    var valueForLength = 0
    var valueForMinutes = 0
    var valueForDescription = ""
    var previousVC = ActivitiesTableViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = valueForName
        typeLbl.text = valueForType

        titleBackground.layer.cornerRadius = 7
        titleBackground.layer.backgroundColor = UIColor.systemGray6.cgColor
        titleBackground.layer.masksToBounds = true
        detailBackground.layer.cornerRadius = 7
        detailBackground.layer.masksToBounds = true
        detailBackground.layer.backgroundColor = UIColor.systemGray6.cgColor
        // Do any additional setup after loading the view.
        saveBtn.layer.backgroundColor = UIColor.systemBlue.cgColor
        lengthTxt.keyboardType = UIKeyboardType.numberPad
        minutesTxt.keyboardType = UIKeyboardType.numberPad
        errorView.isHidden = true
        errorLbl.adjustsFontSizeToFitWidth = true
    
    }
    
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var errorView: UIView!
    
    //User can go back
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var lengthTxt: UITextField!
    @IBAction func lengthTxt(_ sender: Any) {
        var text: String = lengthTxt.text!
        var value = Int(text)
        valueForLength = value!
    }
    
    
    @IBOutlet weak var minutesTxt: UITextField!
    
    //sets the minutes value
    @IBAction func minutesTxt(_ sender: Any) {
        var text: String = minutesTxt.text!
        var value = Int(text)
        valueForMinutes = value!
    }
    
    //sets the description value
    @IBOutlet weak var descriptionTxt: UITextField!
    @IBAction func descriptionTxt(_ sender: Any) {
        var text: String = descriptionTxt.text!
        valueForDescription = text
    }
    
    //adds an activity to the table view on the activities screen.
    @IBAction func addActivity(_ sender: Any) {
        guard var length = lengthTxt.text else{return}
        let valueLength = Int(length) ?? 0
        valueForLength = valueLength
        guard var minutes = minutesTxt.text else {return}
        let minutesLength = Int(minutes) ?? 0
        valueForMinutes = minutesLength
        
        
        guard var description = descriptionTxt.text else{return}
        let desValue = description
        valueForDescription = desValue
        
        
        
         var dailyActivitiy = activityLog(name: valueForName, length: valueForLength, description: valueForDescription,minutes: valueForMinutes)
        //Stops the user entering unbound values
        if valueForLength > 24 || valueForLength < 0{
            errorView.isHidden = false
            
        }else if  valueForMinutes > 59 || valueForMinutes < 0{
            
            
        } else { 
                entryActivities.append(dailyActivitiy)
            dismiss(animated: true, completion: nil)
        }
        
     
        
        //for i in previousVC.entryActivities{
          //  print(i.name)
        
        
        
       
        
    }
    
    @IBOutlet weak var detailBackground: UIView!
    @IBOutlet weak var titleBackground: UIView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var typeLbl: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
