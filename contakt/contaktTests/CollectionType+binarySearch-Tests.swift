//
//  CollectionType+binarySearch-Tests.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-23.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import XCTest

class CollectionType_binarySearch_Tests: XCTestCase
{
    func test_newValue_highIntMax() {
        let range = 0 ..< Int.max
        let index = range.binarySearch(withPredicate: { $0 < Int.max })
        XCTAssertEqual(index, Int.max)
    }
    
    func test_existingValue() {
        let collection = [2, 3, 10, 15, 20, 32, 49, 99]
        let index = collection.binarySearch { $0 < 49 }
        XCTAssertEqual(index, 6)
    }
    
    func test_existingValue_first() {
        let collection = [2, 3, 10, 15, 20, 32, 49, 99]
        let index = collection.binarySearch { $0 < 2 }
        XCTAssertEqual(index, 0)
    }
    
    func test_existingValue_last() {
        let collection = [2, 3, 10, 15, 20, 32, 49, 99]
        let index = collection.binarySearch { $0 < 99 }
        XCTAssertEqual(index, 7)
    }
    
    func test_newValue() {
        let collection = [2, 3, 10, 15, 20, 32, 49, 99]
        let index = collection.binarySearch { $0 < 16 }
        XCTAssertEqual(index, 4)
    }
    
    func test_newValue_beforeFirst() {
        let collection = [2, 3, 10, 15, 20, 32, 49, 99]
        let index = collection.binarySearch { $0 < -10 }
        XCTAssertEqual(index, 0)
    }
    
    func test_newValue_afterLast() {
        let collection = [2, 3, 10, 15, 20, 32, 49, 99]
        let index = collection.binarySearch { $0 < 9999 }
        XCTAssertEqual(index, 8)
    }
    
    func test_empty() {
        let collection: [Int] = []
        let index = collection.binarySearch { $0 < 9999 }
        XCTAssertEqual(index, 0)
    }
}
