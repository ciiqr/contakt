//
//  String+insensitiveContains.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-22.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import Foundation

extension String
{
    func insensitiveContains(stringToFind: String) -> Bool {
        return self.lowercaseString.containsString(stringToFind.lowercaseString)
    }
    
    func insensitiveContains(find: CharacterView) -> Bool {
        // TODO: This could be more efficient but seeing as Character and CharacterView don't contain methods to convert case, this is the easiest option for now...
        return self.lowercaseString.containsString(String(find))
    }
}