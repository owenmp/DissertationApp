//
//  ArrayExtension.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 27/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import Foundation


extension Array where Element: Hashable {
    func removingDuplicate() -> [Element] {
        var addedDict = [Element:Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    mutating func removeDuplicates() {
        self = self.removingDuplicate()
    }
}
