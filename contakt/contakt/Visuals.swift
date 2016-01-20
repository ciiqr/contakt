//
//  Visuals.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-19.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import UIKit

class Visuals
{
    // Constants
    private static let white = UIColor.whiteColor()
    private static let lightBlue = UIColor(hex: 0xADD8E6)
    private static let lightGray = UIColor(hex: 0xFCFCFC)
    private static let lightGreen = UIColor(hex: 0xBDDCB6)
    private static let lightPurple = UIColor(hex: 0xC9A3DB)
    
    // Nav Bar
    static let navBarColour = lightBlue
    static let navBarTint = white
    static let navBarTextAttributes = [NSForegroundColorAttributeName : navBarTint]
    
    // Background
    static let backgroundColour = lightGray
    
    // Contacts List
    static let contactSwipePhoneActionColour = lightGreen
    static let contactSwipeEmailActionColour = lightPurple
}