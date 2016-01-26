//
//  String+insensitiveContains-Tests.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-24.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import XCTest

class String_insensitiveContains_Tests: XCTestCase
{
    func test_string_lower_contains() {
        let string = "this is a string"
        
        XCTAssert(string.insensitiveContains("a STR"))
        XCTAssert(string.insensitiveContains("THIS"))
        XCTAssert(string.insensitiveContains("this is a string"))
    }
    
    func test_string_upper_contains() {
        let string = "THIS IS A STRING"
        
        XCTAssert(string.insensitiveContains("a STR"))
        XCTAssert(string.insensitiveContains("THIS"))
        XCTAssert(string.insensitiveContains("this is a string"))
    }
    
    func test_string_someUpper_contains() {
        let string = "This is A STRING"
        
        XCTAssert(string.insensitiveContains("a STR"))
        XCTAssert(string.insensitiveContains("THIS"))
        XCTAssert(string.insensitiveContains("this is a string"))
    }
    
    func test_characterView_lower_contains() {
        let string = "this is a string"
        
        XCTAssert(string.insensitiveContains("a STR".characters))
        XCTAssert(string.insensitiveContains("THIS".characters))
        XCTAssert(string.insensitiveContains("this is a string".characters))
    }
    
    func test_characterView_upper_contains() {
        let string = "THIS IS A STRING"
        
        XCTAssert(string.insensitiveContains("a STR".characters))
        XCTAssert(string.insensitiveContains("THIS".characters))
        XCTAssert(string.insensitiveContains("this is a string".characters))
    }
    
    func test_characterView_someUpper_contains() {
        let string = "This is A STRING"
        
        XCTAssert(string.insensitiveContains("a STR".characters))
        XCTAssert(string.insensitiveContains("THIS".characters))
        XCTAssert(string.insensitiveContains("this is a string".characters))
    }
}
