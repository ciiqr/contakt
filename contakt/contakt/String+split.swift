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
    func split(onDelimiter delimiter: Character = " ") -> [String] {
        return self.characters.split{$0 == delimiter}.map(String.init)
    }
}