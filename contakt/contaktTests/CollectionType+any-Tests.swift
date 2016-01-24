//
//  CollectionType+any-Tests.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-23.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import XCTest

class CollectionType_any_Tests: XCTestCase
{
    // MARK: Condition always true
    func test_alwaysTrue_empty() {
        let collection: [Int] = []
        
        XCTAssertEqual(collection.any({ _ in true }), false)
    }
    
    func test_alwaysTrue() {
        let collection: [Int] = [0]
        
        XCTAssertEqual(collection.any({ _ in true }), true)
    }
    
    // MARK: Condition always false
    func test_alwaysFalse_empty() {
        let collection: [Int] = []
        
        XCTAssertEqual(collection.any({ _ in false }), false)
    }

    func test_alwaysFalse() {
        let collection: [Int] = [0]
        
        XCTAssertEqual(collection.any({ _ in false }), false)
    }
    
    // MARK: Proper Conditions
    func test_properCondition_empty() {
        let collection: [Int] = []
        
        XCTAssertEqual(collection.any({ $0 > 10 }), false)
    }
    
    func test_properCondition_oneFalse() {
        let collection: [Int] = [110, 20, 30, -10, 90]
        
        XCTAssertEqual(collection.any({ $0 > 10 }), true)
    }
    
    func test_properCondition_allFalse() {
        let collection: [Int] = [0, 2, 3, -10, 9]
        
        XCTAssertEqual(collection.any({ $0 > 10 }), false)
    }
    
    func test_properCondition_oneTrue() {
        let collection: [Int] = [0, 2, 3, 11, 9]
        
        XCTAssertEqual(collection.any({ $0 > 10 }), true)
    }
    
    func test_properCondition_allTrue() {
        let collection: [Int] = [110, 20, 30, 11, 90]
        
        XCTAssertEqual(collection.any({ $0 > 10 }), true)
    }
}
