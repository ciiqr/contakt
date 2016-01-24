//
//  Contact+fullName-Tests.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-23.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import XCTest

class Contact_fullName_Tests: XCTestCase
{
    func test_entireName() {
        let contact = Contact(firstName: "William", middleName: "Aaron", lastName: "Villeneuve")
        
        XCTAssertEqual(contact.fullName(), "William Aaron Villeneuve")
        XCTAssertEqual(contact.fullName(middleInitial: true), "William A. Villeneuve")
    }
    
    // MARK: Missing one name
    func test_firstMissing() {
        let contact = Contact(middleName: "Aaron", lastName: "Villeneuve")
        
        XCTAssertEqual(contact.fullName(), "Aaron Villeneuve")
        XCTAssertEqual(contact.fullName(middleInitial: true), "A. Villeneuve")
    }
    
    func test_middleMissing() {
        let contact = Contact(firstName: "William", lastName: "Villeneuve")
        
        XCTAssertEqual(contact.fullName(), "William Villeneuve")
        XCTAssertEqual(contact.fullName(middleInitial: true), "William Villeneuve")
    }
    
    func test_lastMissing() {
        let contact = Contact(firstName: "William", middleName: "Aaron")
        
        XCTAssertEqual(contact.fullName(), "William Aaron")
        XCTAssertEqual(contact.fullName(middleInitial: true), "William A.")
    }
    
    // MARK: Missing two names
    func test_firstMiddleMissing() {
        let contact = Contact(lastName: "Villeneuve")
        
        XCTAssertEqual(contact.fullName(), "Villeneuve")
        XCTAssertEqual(contact.fullName(middleInitial: true), "Villeneuve")
    }
    
    func test_firstLastMissing() {
        let contact = Contact(middleName: "Aaron")
        
        XCTAssertEqual(contact.fullName(), "Aaron")
        XCTAssertEqual(contact.fullName(middleInitial: true), "A.")
    }
    
    func test_middleLastMissing() {
        let contact = Contact(firstName: "William")
        
        XCTAssertEqual(contact.fullName(), "William")
        XCTAssertEqual(contact.fullName(middleInitial: true), "William")
    }
    
    // MARK: Empty contact
    func test_empty() {
        let contact = Contact()
        
        XCTAssertEqual(contact.fullName(), "")
        XCTAssertEqual(contact.fullName(middleInitial: true), "")
    }
    
}
