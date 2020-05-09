//
//  ArrayExtension.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 27/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import Foundation


//Array extension which allows duplicate elements to be removed

extension Array where Element: Hashable {
    //function that removes duplicates
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
