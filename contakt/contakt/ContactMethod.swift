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
    // MARK: Instance Variables
    
    // NOTE: some user supplied name for this contact method record (ie. home, work, mobile, main, etc)
    var label: String
    var info: ContactMethodInfo
    
    // MARK: Properties
    var isEmail: Bool {
        get {
            if case .Email = self.info {
                return true
            }
            return false
        }
    }
    var isPhone: Bool {
        get {
            if case .Phone = self.info {
                return true
            }
            return false
        }
    }
    // TODO: There must be a better way than the above... is does keep things short elsewhere though
    
    // MARK: Constructors
    init(_ info: ContactMethodInfo, label: String = "") {
        self.info = info
        self.label = label
    }

    // MARK: Methods
    // MARK: initiate contact
    func initiateContact() -> Bool {
        switch info
        {
        case .Email(let addr):
            return initiateEmail(addr)
        case .Phone(let phone):
            return initiatePhoneCall(phone)
        }
    }
    
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
        if let email = ("mailto:\(addr)").stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet()) {
            if let mailToUrl = NSURL(string: email) {
                if UIApplication.sharedApplication().canOpenURL(mailToUrl) {
                    return UIApplication.sharedApplication().openURL(mailToUrl)
                }
            }
        }
        return false
    }
}