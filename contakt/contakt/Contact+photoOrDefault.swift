//
//  Contact+photoOrDefault.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-22.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import UIKit

extension Contact
{
    func photoOrDefault() -> UIImage {
        if let photo = self.photo {
            return photo
        }
        else {
            return Visuals.contactDefaultPhoto
        }
    }
}