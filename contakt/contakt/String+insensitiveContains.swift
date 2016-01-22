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
}