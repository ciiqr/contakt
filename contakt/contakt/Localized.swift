//
//  Localized.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-22.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import Foundation

struct Localized
{
    // TODO: Localize all of these
    
    
    static func sortOrder(order: ContactsSortOrder) -> String {
        switch order
        {
        case .FirstName:
            return "First"
        case .LastName:
            return "Last"
        }
    }
    
    static func searchScope(scope: ContactSearchScope) -> String {
        switch scope
        {
        case .All:
            return "All"
        case .Names:
            return "Names"
        case .OtherInfo:
            return "Other Info"
        }
    }
    
    static func gender(gender: Gender) -> String {
        switch gender
        {
        case .Female:
            return "Female"
        case .Male:
            return "Male"
        case .NonBinary:
            return "Non-Binary"
        case .None:
            return "None"
        }
    }
}