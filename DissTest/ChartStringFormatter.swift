//
//  ChartStringFormatter.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 08/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import Foundation
import Charts

class ChartStringFormatter: NSObject, IAxisValueFormatter {

    var nameValues: [String]! =  ["Mood", "Stress", "Productivity"]

    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return String(describing: nameValues[Int(value)])
    }
}
