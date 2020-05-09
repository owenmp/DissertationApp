//
//  Symptom.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 23/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import Foundation


class Symptom {
    
    //Variables
    var date: String
    var Name: String
    var Description: String
    var Drugs: String
    
    
    //initializes the object
    init(Date: String, Name: String, Description: String, Drugs: String) {
        
        self.date = Date
        self.Name = Name
        self.Description = Description
        self.Drugs = Drugs
    }
    
    
    
}
