//
//  Contact+fullName.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-22.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import Foundation

extension Contact
{
    // Formats the contact's full name with the option to only have the middle names first initial, ie. "Richard M. Stallman" OR "Richard Matthew Stallman"
    @warn_unused_result
    func fullName(middleInitial middleInitial: Bool = false) -> String {
        let first = formatName(self.firstName, postfix: " ")
        let middle = formatName(self.middleName, postfix: (middleInitial ? ". " : " "), justInitial: middleInitial)
        let last = formatName(self.lastName, postfix: " ")
        
        return first + middle + last
    }
    
    @warn_unused_result
    private func formatName(name: String, postfix: String = "", justInitial: Bool = false) -> String {
        if name.characters.count > 0 {
            return justInitial ? String(name.characters.prefix(1)) + postfix
                : name + postfix
        }
        return ""
    }
}