//
//  ContactMethod.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-18.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import Foundation
import UIKit

enum ContactMethodInfo : CustomStringConvertible
{
    case Email(String)
    case Phone(String) // TODO: Maybe store the phone number a bit differently...
    // TODO: Add other contact methods...
    
    var description: String {
        get {
            switch self
            {
            case .Email:
                return "Email";
            case .Phone:
                return "Phone";
            }
        }
    }
}

class ContactMethod
{
    // MARK: - Properties
    
    // MARK: Instance
    // NOTE: A user supplied name for this contact method record (ie. home, work, mobile, main, etc)
    var label: String
    var info: ContactMethodInfo
    
    // MARK: Calculated
    // TODO: There must be a better way than these... is does keep things short elsewhere for now though
    var isEmail: Bool {
        if case .Email = self.info {
            return true
        }
        return false
    }
    var isPhone: Bool {
        if case .Phone = self.info {
            return true
        }
        return false
    }
    
    // MARK: - Constructors
    init(_ info: ContactMethodInfo, label: String = "") {
        self.info = info
        self.label = label
    }

    // MARK: - Methods
    // MARK: Initiate contact
    func initiateContact() -> Bool {
        switch info
        {
        case .Email(let addr):
            return initiateEmail(addr)
        case .Phone(let phone):
            return initiatePhoneCall(phone)
        }
    }
    
    // TODO: This code may very well be moved elsewhere, it's mostly dependent on the complexity of future contact methods...
    private func initiatePhoneCall(number: String) -> Bool
    {
        // TODO: Consider telprompt, which is unofficial but arguably a better experience for the user (it prompts before making the call)...
        // INFO: http://stackoverflow.com/a/27077450
        if let phoneUrl = NSURL(string: "tel:\(number)") {
            if UIApplication.sharedApplication().canOpenURL(phoneUrl) {
                return UIApplication.sharedApplication().openURL(phoneUrl)
            }
        }
        return false
    }
    private func initiateEmail(addr: String) -> Bool
    {
        if let email = ("mailto:\(addr)")
            .stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())
        {
            if let mailToUrl = NSURL(string: email) {
                if UIApplication.sharedApplication().canOpenURL(mailToUrl) {
                    return UIApplication.sharedApplication().openURL(mailToUrl)
                }
            }
        }
        return false
    }
}