//
//  Gender.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-18.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import Foundation

enum Gender : String, CustomStringConvertible
{
    case None
    case Male
    case Female
    case Agender
    case TransMTF
    case TransFTM
    // TODO: Others...
    
    var description: String {
        get {
            return self.rawValue
        }
    }
}