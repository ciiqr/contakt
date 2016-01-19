//
//  CollectionType+any.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-19.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import Foundation

extension CollectionType
{
    // Returns true if the condition handler returns true for any of the elements
    func any(condition: (Self.Generator.Element) -> Bool) -> Bool
    {
        for element in self
        {
            if condition(element) {
                return true
            }
        }
        return false
    }
}