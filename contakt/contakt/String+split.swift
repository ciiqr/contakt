//
//  String+split.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-21.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import Foundation

extension String
{
    // TODO: Should probably support more of the arguments that self.characters.split supports
    func split<C: CollectionType where C.Generator.Element == Character>
        (onDelimiters delimiters: C) -> [String.CharacterView]
    {
        // If no parameters, split on spaces
        if delimiters.count == 0 {
            return self.characters.split { $0 == " " }
        }
        // Else, split on any of the provided characters
        return self.characters.split { delimiters.contains($0) }
    }
    
    func split(onDelimiters delimiters: Character...) -> [String.CharacterView] {
        return self.split(onDelimiters: delimiters)
    }
    
    func split(onDelimiter delimiter: Character) -> [String.CharacterView] {
        return self.split(onDelimiters: delimiter)
    }
}