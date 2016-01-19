//
//  UIColor+hex.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-19.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import UIKit

extension UIColor
{
    // TODO: Test these
    
    // For creating UIColor instances with hex numbers. ie:
    // UIColor(hex: 0xFF00FF)
    // UIColor(hexAlpha: 0x00000088)
    
    convenience init(hexAlpha hex: Int)
    {
        assert(hex <= 0xFFFFFFFF, "hex colours with alpha should be represented with 8 hex digits, no more")
        
        self.init(colorLiteralRed: (Float(hex >> 24 & 0xFF) / 0xFF),
            green: (Float(hex >> 16 & 0xFF) / 0xFF),
            blue: (Float(hex >> 8 & 0xFF) / 0xFF),
            alpha: (Float(hex & 0xFF) / 0xFF))
    }
    
    convenience init(hex: Int)
    {
        assert(hex <= 0xFFFFFF, "hex colours without alpha should be represented with 6 hex digits, no more")
        
        self.init(colorLiteralRed: (Float(hex >> 16 & 0xFF) / 0xFF),
            green: (Float(hex >> 8 & 0xFF) / 0xFF),
            blue: (Float(hex & 0xFF) / 0xFF),
            alpha: 0xFF)
    }
}