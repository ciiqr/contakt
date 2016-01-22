//
//  Contact.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-18.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import Foundation
import UIKit

class Contact : Equatable
{
    // MARK: - Properties
    // MARK: Instance
    // Names
    var firstName: String
    var middleName: String
    var lastName: String
    var nickName: String

    // Other Info
    var gender: Gender
    // TODO: Should instead just store a file name and save all contact images in a specific location
    // - Then whenever we need to retrieve the photo, we would first check an in-memory cache for the photo before loading it from disk
    // - if there is need to load the photo from the net, we could fetch it then both save it to some path and cache it right away this way whatever api could retrieve it from the cache as soon as it was done downloading without necessarily having to wait for it to finish saving to disk
    var photo: UIImage?
    
    // Contact Info
    var contactMethods: [ContactMethod]
    
    // TODO: Have other info... (will need to added to the appropriate searchable fields)
    // - Have dates (Birth day, Aniversary, etc) generic like ContactMethod's
    // - Title (Mr, Ms, etc)
    
    // MARK: Constructors
    init(firstName: String = "", middleName: String = "", lastName: String = "", nickName: String = "",
        gender: Gender = .None, photo: UIImage? = nil, contactMethods: [ContactMethod] = []) {
            
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.nickName = nickName
        self.gender = gender
        self.photo = photo
        self.contactMethods = contactMethods
    }
}

func ==(lhs: Contact, rhs: Contact) -> Bool {
    return (lhs.firstName == rhs.firstName &&
        lhs.middleName == rhs.middleName &&
        lhs.lastName == rhs.lastName &&
        lhs.nickName == rhs.nickName &&
        lhs.gender == rhs.gender &&
        lhs.photo == rhs.photo &&
        // TODO: This currently doesn't check if both arrays contain the same values and for efficiency maybe shouldn't? I mean, if all other fields are equal, this is likely to be the same. But it's technically incomplete... Though, it might not be a big deal to compare if we assume there aren't going to be that many contactMethods...
        lhs.contactMethods.count == rhs.contactMethods.count
    )
}
