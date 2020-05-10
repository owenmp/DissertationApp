//
//  ChartStringFormatter.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 08/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//  //Formats the bar chart values

import Foundation
import Charts

class ChartStringFormatter: NSObject, IAxisValueFormatter {
    //Data points in a bar chart
    var nameValues: [String]! =  ["Mood", "Stress", "Productivity"]

    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return String(describing: nameValues[Int(value)])
    }
}
