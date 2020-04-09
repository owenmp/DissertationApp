//
//  detailActivityViewController.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 06/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import UIKit

class detailActivityViewController: UIViewController {
    
    var valueForName = ""
    var valueForType = ""
    var valueForLength = 0
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
    
    }
    
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
    
    @IBOutlet weak var descriptionTxt: UITextField!
    @IBAction func descriptionTxt(_ sender: Any) {
        var text: String = descriptionTxt.text!
        valueForDescription = text
    }
    
    @IBAction func addActivity(_ sender: Any) {
        guard var length = lengthTxt.text else{return}
        let valueLength = Int(length) ?? 0
        valueForLength = valueLength
        
        guard var description = descriptionTxt.text else{return}
        let desValue = description
        valueForDescription = desValue
        
        
        
        var dailyActivitiy = activityLog(name: valueForName, length: valueForLength, description: valueForDescription)
        entryActivities.append(dailyActivitiy)
        
        //for i in previousVC.entryActivities{
          //  print(i.name)
        
        
        
       dismiss(animated: true, completion: nil)
        
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
