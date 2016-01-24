//
//  String+split-Tests.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-23.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import XCTest

class String_split_Tests: XCTestCase
{
    // Unfortunately CharacterView doesn't implement Equatable so we must map split's return values to String's
    
    func test_empty() {
        let string = ""
        
        XCTAssertEqual(string.split(onDelimiter: " ").map(String.init), [])
        XCTAssertEqual(string.split(onDelimiters: " ", "\t").map(String.init), [])
    }
    
    func test_allDelimiters() {
        let string = "    "
        let string2 = "\t    \t   \t\t\t "
        
        XCTAssertEqual(string.split(onDelimiter: " ").map(String.init), [])
        XCTAssertEqual(string.split(onDelimiters: " ", "\t").map(String.init), [])
        XCTAssertEqual(string2.split(onDelimiters: " ", "\t").map(String.init), [])
    }
    
    func test_onlyDelimitersBefore() {
        let string = "    test"
        let string2 = "\t    \t   \t\t\t test"
        
        XCTAssertEqual(string.split(onDelimiter: " ").map(String.init), ["test"])
        XCTAssertEqual(string.split(onDelimiters: " ", "\t").map(String.init), ["test"])
        XCTAssertEqual(string2.split(onDelimiters: " ", "\t").map(String.init), ["test"])
    }
    
    func test_onlyDelimitersAfter() {
        let string = "test    "
        let string2 = "test\t    \t   \t\t\t "
        
        XCTAssertEqual(string.split(onDelimiter: " ").map(String.init), ["test"])
        XCTAssertEqual(string.split(onDelimiters: " ", "\t").map(String.init), ["test"])
        XCTAssertEqual(string2.split(onDelimiters: " ", "\t").map(String.init), ["test"])
    }
    
    func test_mixedDelimiters() {
        let string = "test    test2              test3"
        let string2 = "test\t    \t   test2\t\t\t test3"
        
        XCTAssertEqual(string.split(onDelimiter: " ").map(String.init), ["test", "test2", "test3"])
        XCTAssertEqual(string.split(onDelimiters: " ", "\t").map(String.init), ["test", "test2", "test3"])
        XCTAssertEqual(string2.split(onDelimiters: " ", "\t").map(String.init), ["test", "test2", "test3"])
    }
    
    func test_mixedDelimitersAndBeforeAfter() {
        let string = "   test    test2              test3   "
        let string2 = "           \ttest\t    \t   test2\t\t\t test3\t  "
        
        XCTAssertEqual(string.split(onDelimiter: " ").map(String.init), ["test", "test2", "test3"])
        XCTAssertEqual(string.split(onDelimiters: " ", "\t").map(String.init), ["test", "test2", "test3"])
        XCTAssertEqual(string2.split(onDelimiters: " ", "\t").map(String.init), ["test", "test2", "test3"])
    }
    
    //
//    func test_mixedNewlineDelimiter_1() {
//        let string = "Line 1\r\nLine 2\nLine 3\r"
//        
//        XCTAssertEqual(string.split(onDelimiters: "\r", "\n").map(String.init), ["Line 1", "Line 2", "Line 3"])
//    }
//    func test_mixedNewlineDelimiter_2() {
//        let string = "Line 1\r\nLine 2\nLine 3\r"
//        
//        XCTAssertEqual(string.split(onDelimiters: "\n", "\r").map(String.init), ["Line 1", "Line 2", "Line 3"])
//    }
    // TODO: Determine why these 2 succeed while the above 2 fail(changing \r to any other character fixes the above, but that doesn't really explain much)...
    func test_mixedNewlineDelimiter_working_1() {
        let string = "Line 1\n\rLine 2\rLine 3\n"
        
        XCTAssertEqual(string.split(onDelimiters: "\r", "\n").map(String.init), ["Line 1", "Line 2", "Line 3"])
    }
    func test_mixedNewlineDelimiter_working_2() {
        let string = "Line 1\n\rLine 2\rLine 3\n"
        
        XCTAssertEqual(string.split(onDelimiters: "\n", "\r").map(String.init), ["Line 1", "Line 2", "Line 3"])
    }
}
