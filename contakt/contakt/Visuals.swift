//
//  Visuals.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-19.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import UIKit

struct Visuals
{
    // MARK: - Constants
    
    // MARK: Colours
    private static let white = UIColor.whiteColor()
    private static let lightBlue = UIColor(hex: 0xADD8E6)
    private static let lightGray = UIColor(hex: 0xFCFCFC)
    private static let lightGreen = UIColor(hex: 0xBDDCB6)
    private static let lightPurple = UIColor(hex: 0xC9A3DB)
    
    // MARK: Nav Bar
    static let navBarBackgroundColour = lightBlue
    static let navBarTint = white
    static let navBarTextAttributes = [NSForegroundColorAttributeName : navBarTint]
    static let navBarIcon = UIImage(imageLiteral: "navbar-icon")
    static let navBarFont = UIFont(name: "AvenirNext", size: 20)
    
    // MARK: Background
    static let backgroundColour = lightGray
    
    // MARK: Contacts List
    static let contactSwipePhoneActionColour = lightGreen
    static let contactSwipeEmailActionColour = lightPurple
    static let contactsListSectionIndexColor = lightBlue
    static let contactsListSectionIndexBackgroundColor = lightGray
    
    // MARK: Search bar
    static let searchBarBackgroundColour = lightBlue
    static let searchBarTint = white
    static let searchBarTextFieldTint = lightBlue
    
    // MARK: Contact photo
    static let contactDefaultPhoto = UIImage(imageLiteral: "contact-photo-default")
}