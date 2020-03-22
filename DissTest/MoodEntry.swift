//
//  MoodEntry.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 12/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import Foundation

class Mood {
    var Date: String
    var Sleep: Int
    var Water: Int
    var Stress: Int
    var Exercise: Int
    var Location: String
    var Alcohol: Int
    var Mood: Int
    var Productivity: Int
    var Notes: String
    
    init(Date: String, Sleep: Int, Water: Int, Stress: Int, Exercise: Int, Location: String,Alcohol: Int, Mood: Int, Productivity: Int, Notes: String){
        self.Date = Date
        self.Sleep = Sleep
        self.Water = Water
        self.Stress = Stress
        self.Exercise = Exercise
        self.Location = Location
        self.Alcohol = Alcohol
        self.Mood = Mood
        self.Productivity = Productivity
        self.Notes = Notes
    }
    
}
