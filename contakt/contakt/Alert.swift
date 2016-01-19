//
//  Alert.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-19.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import UIKit

class Alert {
    static func displaySimple(vc: UIViewController, title: String, message: String, _ okButtonText: String = "OK") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: okButtonText, style: .Default) { _ in })
        vc.presentViewController(alert, animated: true){}
    }
    
    // TODO: Support more complex alerts...
}