//
//  OrderedDictionary-Tests.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-24.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import XCTest

class OrderedDictionary_Tests: XCTestCase
{
    // MARK: - Test Utilities
    let initialOD: OrderedDictionary<Int, String> = [
        15: "fifteen",
        3: "three",
        20: "twenty",
        99: "ninety nine",
        49: "forty nine",
        2: "two",
        10: "ten",
        32: "thirty two",
    ]
    let initialODSortedArray = [
        (2, "two"),
        (3, "three"),
        (10, "ten"),
        (15, "fifteen"),
        (20, "twenty"),
        (32, "thirty two"),
        (49, "forty nine"),
        (99, "ninety nine")
    ]
    
    let initialODSortedReverseArray = [
        (99, "ninety nine"),
        (49, "forty nine"),
        (32, "thirty two"),
        (20, "twenty"),
        (15, "fifteen"),
        (10, "ten"),
        (3 , "three"),
        (2 , "two")
    ]
    
    func assertEmpty(orderedDictionary: OrderedDictionary<Int, String>) {
        XCTAssert(orderedDictionary.count == 0)
        XCTAssert(orderedDictionary == [:])
    }
    
    func assertEqual(orderedDictionary: OrderedDictionary<Int, String>, _ array: [(Int, String)]) {
        XCTAssert(orderedDictionary.count == array.count)
        for index in 0 ..< orderedDictionary.data.count
        {
            let odPair = orderedDictionary.data[index]
            let (arrayPairKey, arrayPairValue) = array[index]
            // If either the key or the value aren't equal, we're not equal
            XCTAssert(odPair.key == arrayPairKey && odPair.value == arrayPairValue)
        }
    }
    
    // MARK: - Constructors
    func test_init() {
        let od = OrderedDictionary<Int, String>()
        assertEmpty(od)
    }
    
    func test_init_predicate() {
        let od1 = OrderedDictionary<Int, String>() { $1 < $0 }
        let od2 = OrderedDictionary<Int, String>(predicate: { $1 < $0 })
        
        assertEmpty(od1)
        assertEmpty(od2)
    }
    
    func test_init_minimumCapacity() {
        let od = OrderedDictionary<Int, String>(minimumCapacity: 20)
        
        assertEmpty(od)
        XCTAssertGreaterThanOrEqual(od.capacity, 20)
    }
    
    func test_init_minimumCapacity_predicate() {
        let od1 = OrderedDictionary<Int, String>(minimumCapacity: 20, predicate: { $1 < $0 })
        let od2 = OrderedDictionary<Int, String>(minimumCapacity: 20) { $1 < $0 }
        
        assertEmpty(od1)
        assertEmpty(od2)
        XCTAssertGreaterThanOrEqual(od1.capacity, 20)
        XCTAssertGreaterThanOrEqual(od2.capacity, 20)
    }
    
    func test_init_elements_variableTuples() {
        let od = OrderedDictionary<Int, String>(elements: (2, "two"), (4, "four"), (3, "three"))
        
        assertEqual(od, [(2, "two"), (3, "three"), (4, "four")])
    }
    
    func test_init_elements_variableTuples_predicate() {
        let od1 = OrderedDictionary<Int, String>(elements: (2, "two"), (4, "four"), (3, "three"), predicate: { $1 < $0 })
        let od2 = OrderedDictionary<Int, String>(elements: (2, "two"), (4, "four"), (3, "three")) { $1 < $0 }
        
        assertEqual(od1, [(4, "four"), (3, "three"), (2, "two")])
        assertEqual(od2, [(4, "four"), (3, "three"), (2, "two")])
    }
    
    func test_init_elements_collection() {
        let od = OrderedDictionary<Int, String>(elements: [2: "two", 4: "four", 3: "three"])
        
        assertEqual(od, [(2, "two"), (3, "three"), (4, "four")])
    }
    
    func test_init_elements_collection_predicate() {
        let od1 = OrderedDictionary<Int, String>(elements: [2: "two", 4: "four", 3: "three"], predicate: { $1 < $0 })
        let od2 = OrderedDictionary<Int, String>(elements: [2: "two", 4: "four", 3: "three"]) { $1 < $0 }
        
        assertEqual(od1, [(4, "four"), (3, "three"), (2, "two")])
        assertEqual(od2, [(4, "four"), (3, "three"), (2, "two")])
    }
    
    // MARK: - Properties
    
    func test_predicate_didSet() {
        var od = initialOD
        assertEqual(od, initialODSortedArray)
        od.predicate = { $1 < $0 }
        assertEqual(od, initialODSortedReverseArray)
    }
    
    // MARK: - Methods
    func test_binarySearch_forKey_existingValue() {
        let od = initialOD
        let index = od.binarySearch(forKey: 49)
        XCTAssertEqual(index, 6)
    }
    
    func test_binarySearch_forKey_newValue() {
        let od = initialOD
        let index = od.binarySearch(forKey: 20)
        XCTAssertEqual(index, 4)
    }
    
    func test_indexMatches_shouldMatch() {
        let od = initialOD
        
        XCTAssert(od.indexMatches(2, key: 10))
    }
    
    func test_indexMatches_shouldNotMatch() {
        let od = initialOD
        
        XCTAssertFalse(od.indexMatches(3, key: 10))
    }
    
    func test_indexMatches_doesNotContain() {
        let od = initialOD
        
        XCTAssertFalse(od.indexMatches(8, key: 100))
    }
    
    // MARK: Dictionary
    func test_subscript_TKey() {
        let od = initialOD
        
        XCTAssertEqual(od[20], "twenty")
        XCTAssertEqual(od[10000], nil)
    }
    func test_indexForKey() {
        let od = initialOD
        
        XCTAssertEqual(od.indexForKey(32), OrderedDictionaryIndex(5))
        XCTAssertEqual(od.indexForKey(10000), nil)
    }
    func test_updateValue_forKey() {
        var od = initialOD
        
        XCTAssertEqual(od[20], "twenty")
        XCTAssert(od == initialOD)
        
        XCTAssertEqual(od.updateValue("TWENTY", forKey: 20), "twenty")
        
        XCTAssertEqual(od[20], "TWENTY")
        XCTAssert(od == [
            2: "two",
            3: "three",
            10: "ten",
            15: "fifteen",
            20: "TWENTY",
            32: "thirty two",
            49: "forty nine",
            99: "ninety nine",
        ])
    }
    func test_removeAtIndex() {
        var od = initialOD
        
        let odPair = od.removeAtIndex(OrderedDictionaryIndex(5))
        
        XCTAssertEqual(odPair.key, 32)
        XCTAssertEqual(odPair.value, "thirty two")
        
        XCTAssert(od == [
            2: "two",
            3: "three",
            10: "ten",
            15: "fifteen",
            20: "twenty",
            49: "forty nine",
            99: "ninety nine",
        ])
    }
    func test_removeValueForKey() {
        var od = initialOD
        
        XCTAssertEqual(od.removeValueForKey(3), "three")
        XCTAssertEqual(od.removeValueForKey(10000), nil)
        
        XCTAssert(od == [
            2: "two",
            10: "ten",
            15: "fifteen",
            20: "twenty",
            32: "thirty two",
            49: "forty nine",
            99: "ninety nine",
        ])
    }
    func test_removeAll() {
        var od = initialOD
        
        od.removeAll()
        
        XCTAssert(od == [:])
        XCTAssert(od.capacity == 0)
    }
    func test_removeAll_keepCapacity_false() {
        var od = initialOD
        
        od.removeAll()
        
        XCTAssert(od == [:])
        XCTAssert(od.capacity == 0)
    }
    func test_removeAll_keepCapacity_true() {
        var od = initialOD
        
        od.removeAll(keepCapacity: true)
        
        XCTAssert(od == [:])
        XCTAssertGreaterThanOrEqual(od.capacity, initialOD.capacity)
    }
    func test_keys() {
        let od = initialOD
        
        XCTAssert(od.keys.elementsEqual([2, 3, 10, 15, 20, 32, 49, 99,]))
    }
    func test_values() {
        let od = initialOD
        
        XCTAssert(od.values.elementsEqual(["two", "three", "ten", "fifteen", "twenty", "thirty two", "forty nine", "ninety nine",]))
    }
    
    // MARK: - Protocols
    
    // MARK: CollectionType
    func test_startIndex_empty() {
        let od: OrderedDictionary<Int, String> = [:]
        XCTAssertEqual(od.startIndex, od.endIndex)
    }
    
    func test_startIndex_notEmpty() {
        let od = initialOD
        XCTAssertEqual(od.startIndex, OrderedDictionaryIndex(0))
    }
    
    func test_endIndex_empty() {
        let od: OrderedDictionary<Int, String> = [:]
        XCTAssertEqual(od.endIndex, OrderedDictionaryIndex(0))
    }
    
    func test_endIndex_notEmpty() {
        let od = initialOD
        XCTAssertEqual(od.endIndex, od.indexForKey(od.last!.key)!.successor())
    }
    
    func test_subscript_Index() {
        let od = initialOD
        
        let odPair = od[OrderedDictionaryIndex(4)]
        
        XCTAssertEqual(odPair.key, 20)
        XCTAssertEqual(odPair.value, "twenty")
    }
    
    // MARK: DictionaryLiteralConvertible
    func test_init_dictionaryLiteral() {
        let od: OrderedDictionary<Int, String> = [2: "two", 4: "four", 3: "three"]
        
        assertEqual(od, [(2, "two"), (3, "three"), (4, "four")])
    }
    
    // MARK: Equatable
    func test_equalsOperator_equal() {
        let od1 = initialOD
        let od2 = initialOD
        
        XCTAssert(od1 == od2)
    }
    
    func test_equalsOperator_notEqual() {
        let od1 = initialOD
        let od2: OrderedDictionary<Int, String> = [
            15: "fifteen",
            3: "three",
            32: "thirty two",
        ]
        
        XCTAssert(!(od1 == od2))
    }
    
    func test_equalsOperator_notEqualDifferentPredicate() {
        let od1 = initialOD
        let od2 = OrderedDictionary<Int, String>(elements: initialOD, predicate: { $1 < $0 })
        
        XCTAssert(!(od1 == od2))
    }
    
    // MARK: CustomStringConvertible
    
    func test_description_empty() {
        let od: OrderedDictionary<Int, String> = [:]
        
        XCTAssertEqual(od.description, "[:]")
    }
    
    func test_description_notEmpty() {
        let od = initialOD
        
        XCTAssertEqual(od.description, "[2: \"two\", 3: \"three\", 10: \"ten\", 15: \"fifteen\", 20: \"twenty\", 32: \"thirty two\", 49: \"forty nine\", 99: \"ninety nine\"]")
    }
    
    // MARK: CustomDebugStringConvertible
    func test_debugDescription_empty() {
        let od: OrderedDictionary<Int, String> = [:]
        
        XCTAssertEqual(od.debugDescription, "[:]")
    }
    
    func test_debugDescription_notEmpty() {
        let od = initialOD
        
        XCTAssertEqual(od.debugDescription, "[2: \"two\", 3: \"three\", 10: \"ten\", 15: \"fifteen\", 20: \"twenty\", 32: \"thirty two\", 49: \"forty nine\", 99: \"ninety nine\"]")
    }
}



