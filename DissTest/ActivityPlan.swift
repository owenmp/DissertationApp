//
//  ActivityPlan.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 17/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import Foundation

class ActivityPlan {
    var date: String = ""
    var name: String = ""
    var description: String = ""
    var completed : Int = 0
    
    init(date: String, name: String, description: String, completed: Int) {
        self.date = date
        self.name = name
        self.description = description
        self.completed = completed
        
    }
    
    
}
