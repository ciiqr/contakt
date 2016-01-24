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
    // Formats the contact's full name with the option to only have the middle names first initial,
    // ie. "Richard M. Stallman" OR "Richard Matthew Stallman"
    @warn_unused_result
    func fullName(middleInitial middleInitial: Bool = false) -> String {
        let middle = formatName(self.middleName, justInitial: middleInitial)
        
        return joinNonEmpty(self.firstName, middle, self.lastName, separator: " ")
    }
    
    @warn_unused_result
    private func formatName(name: String, justInitial: Bool) -> String {
        if justInitial && name.characters.count > 0 {
            return String(name.characters.prefix(1)) + "."
        }
        return name
    }
    
    // TODO: Probably move joinNonEmpty
    @warn_unused_result
    private func joinNonEmpty<C: CollectionType where C.Generator.Element == String>
        (parts: C, separator: String = "") -> String
    {
        // TODO: Would generally prefer an iterative approach, though this is rather short...
        return parts.filter({ $0.characters.count > 0 }).joinWithSeparator(separator)
    }
    
    @warn_unused_result
    private func joinNonEmpty(parts: String..., separator: String = "") -> String {
        return joinNonEmpty(parts, separator: separator)
    }
}