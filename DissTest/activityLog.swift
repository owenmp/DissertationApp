//
//  activityLog.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 25/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import Foundation

class activityLog {
    var name: String
   // var type: String
    var length: Int
    var description: String
    
    init(name: String, length: Int, description: String){
        self.name = name
      //  self.type = type
        self.length = length
        self.description = description
    }
}
