//
//  Contact-Tests.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-25.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import XCTest

class Contact_Tests: XCTestCase
{
    let initialContact1 = Contact(firstName: "Thomas", middleName: "A", lastName: "Anderson", nickName: "Neo",
        gender: .Male, photo: nil, contactMethods: [
        ContactMethod(.Email("neo@matrix.net"), label: "Main"),
        ContactMethod(.Phone("312-555-0690"), label: "Home")
    ])
    
    let initialContact2 = Contact(firstName: "Agent", lastName: "Smith", nickName: "Smith", gender: .Male,
        photo: nil, contactMethods: [
        ContactMethod(.Email("agent.smith@matrix.net"), label: "Main"),
        ContactMethod(.Phone("(312)213-3546"), label: "Home")
    ])
    
    func test_equality_same() {
        let contact1 = initialContact1
        let contact2 = initialContact1
        
        XCTAssertEqual(contact1, contact2)
    }
    
    func test_equality_different() {
        let contact1 = initialContact1
        let contact2 = initialContact2
        
        XCTAssertNotEqual(contact1, contact2)
    }
    
    func test_equality_almost_same() {
        let contact1 = initialContact1
        let contact2 = Contact(firstName: "Thomas", middleName: "A", lastName: "Anderson", nickName: "Neo",
            gender: .Female, photo: nil, contactMethods: [
                ContactMethod(.Email("neo@matrix.net"), label: "Main"),
                ContactMethod(.Phone("312-555-0690"), label: "Home")
        ])
        
        XCTAssertNotEqual(contact1, contact2)
    }
}
