//
//  OrderedArray-Tests.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-22.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import XCTest

// TODO: Add back support for ArrayLiteralConvertible and Change the applicable methods below...
class OrderedArray_Tests: XCTestCase
{
    // MARK: - Test Utilities
    
    func assertEmpty(orderedArray: OrderedArray<Int>) {
        XCTAssert(orderedArray.count == 0)
        XCTAssertEqual(orderedArray, OrderedArray<Int>(elements: [])) // TODO: Back to array literal
    }
    
    // MARK: - Constructors
    
    func test_init() {
        let orderedArray = OrderedArray<Int>()
        assertEmpty(orderedArray)
    }

    func test_init_predicate() {
        let orderedArray = OrderedArray<Int>(predicate: { $1 < $0 })
        assertEmpty(orderedArray)
    }
    
    func test_init_minimumCapacity() {
        let orderedArray = OrderedArray<Int>(minimumCapacity: 10)
        assertEmpty(orderedArray)
        
        XCTAssertGreaterThanOrEqual(orderedArray.data.capacity, 10)
    }
    
    func test_init_minimumCapacity_predicate() {
        let orderedArray = OrderedArray<Int>(minimumCapacity: 10, predicate: { $1 < $0 })
        assertEmpty(orderedArray)
        
        XCTAssertGreaterThanOrEqual(orderedArray.data.capacity, 10)
    }
    
    func test_init_elements_predicate() {
        let orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99], predicate: { $1 < $0 })
        XCTAssert(orderedArray.count == 8)
        XCTAssertEqual(orderedArray.data, [99, 49, 32, 20, 15, 10, 3, 2])
        
        let orderedArray2 = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99])
        XCTAssert(orderedArray2.count == 8)
        XCTAssertEqual(orderedArray2.data, [2, 3, 10, 15, 20, 32, 49, 99])
    }
    
    func test_init_count_repeatedValue_predicate() {
        let orderedArray = OrderedArray<Int>(count: 10, repeatedValue: 20, predicate: { $1 < $0 })
        XCTAssert(orderedArray.count == 10)
        XCTAssertEqual(orderedArray.data, [20, 20, 20, 20, 20, 20, 20, 20, 20, 20])
        
        let orderedArray2 = OrderedArray<Int>(count: 10, repeatedValue: 20)
        XCTAssert(orderedArray2.count == 10)
        XCTAssertEqual(orderedArray2.data, [20, 20, 20, 20, 20, 20, 20, 20, 20, 20])
    }
    
    // MARK: - Properties
    
    func test_predicate_didSet() {
        var orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        orderedArray.predicate = { $1 < $0 }
        XCTAssertEqual(orderedArray.data, [99, 49, 32, 20, 15, 10, 3, 2])
    }
    
    // MARK: - Methods
    
    func test_binarySearch_forValue_existingValue() {
        let orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        let index = orderedArray.binarySearch(forValue: 49)
        XCTAssertEqual(index, 6)
    }
    
    func test_binarySearch_forValue_newValue() {
        let orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        let index = orderedArray.binarySearch(forValue: 16)
        XCTAssertEqual(index, 4)
    }
    
    func test_popLast() {
        var orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        
        XCTAssertEqual(orderedArray.popLast(), 99)
        
        XCTAssertEqual(orderedArray.data, [2, 3, 10, 15, 20, 32, 49])
    }
    
    func test_popLast_empty() {
        var orderedArray = OrderedArray<Int>(elements: []) // TODO: Back to array literal
        
        XCTAssertEqual(orderedArray.popLast(), nil)
        
        XCTAssertEqual(orderedArray.data, [])
    }
    
    func test_removeLast() {
        var orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        
        XCTAssertEqual(orderedArray.removeLast(), 99)
        
        XCTAssertEqual(orderedArray.data, [2, 3, 10, 15, 20, 32, 49])
    }
    
    // MARK: - Protocols
    
    // MARK: CollectionType
    
    func test_startIndex_empty() {
        let orderedArray = OrderedArray<Int>(elements: []) // TODO: Back to array literal
        XCTAssertEqual(orderedArray.startIndex, orderedArray.endIndex)
    }
    
    func test_startIndex_notEmpty() {
        let orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        XCTAssertEqual(orderedArray.startIndex, 0)
    }
    
    func test_endIndex_empty() {
        let orderedArray = OrderedArray<Int>(elements: []) // TODO: Back to array literal
        XCTAssertEqual(orderedArray.endIndex, 0)
    }
    
    func test_endIndex_notEmpty() {
        let orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        XCTAssertEqual(orderedArray.endIndex, orderedArray.indexOf(orderedArray.last!)!.successor())
    }
    
    func test_subscript_Index() {
        let orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        
        XCTAssertEqual(orderedArray[4], 20)
    }
    
    // MARK: RangeReplaceableCollectionType
    
    func test_replaceRange_subRange_newElements() {
        var orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        
        orderedArray.replaceRange(2...4, with: [8, 9, 11, 21, 100])
        
        XCTAssertEqual(orderedArray.data, [2, 3, 8, 9, 11, 21, 32, 49, 99, 100])
        
    }
    
    func test_reserveCapacity() {
        var orderedArray = OrderedArray<Int>(elements: []) // TODO: Back to array literal
        
        orderedArray.reserveCapacity(16)
        
        XCTAssertGreaterThanOrEqual(orderedArray.capacity, 16)
    }
    
    func test_append() {
        var orderedArray = OrderedArray<Int>(elements: []) // TODO: Back to array literal
        
        orderedArray.append(3)
        orderedArray.append(10)
        orderedArray.append(20)
        orderedArray.append(32)
        orderedArray.append(49)
        orderedArray.append(15)
        orderedArray.append(2)
        orderedArray.append(99)
        
        XCTAssertEqual(orderedArray, OrderedArray<Int>(elements: [2, 3, 10, 15, 20, 32, 49, 99])) // TODO: Back to array literal
    }
    
    func test_appendContentsOf() {
        var orderedArray = OrderedArray<Int>(elements: []) // TODO: Back to array literal
        
        orderedArray.appendContentsOf([3, 10, 20, 32, 49, 15, 2, 99])
        
        XCTAssertEqual(orderedArray.data, [2, 3, 10, 15, 20, 32, 49, 99])
    }
    
    func test_insert() {
        var orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        
        orderedArray.insert(35, atIndex: 6)
        
        XCTAssertEqual(orderedArray.data, [2, 3, 10, 15, 20, 32, 35, 49, 99])
    }
    
    func test_insertContentsOf() {
        var orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        
        orderedArray.insertContentsOf([4, 6, 7, 8], at: 2)
        
        XCTAssertEqual(orderedArray.data, [2, 3, 4, 6, 7, 8, 10, 15, 20, 32, 49, 99])
    }
    
    func test_removeAtIndex() {
        var orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        
        XCTAssertEqual(orderedArray.removeAtIndex(3), 15)
        
        XCTAssertEqual(orderedArray.data, [2, 3, 10, 20, 32, 49, 99])
    }
    
    func test_removeFirst() {
        var orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        
        XCTAssertEqual(orderedArray.removeFirst(), 2)
        
        XCTAssertEqual(orderedArray.data, [3, 10, 15, 20, 32, 49, 99])
    }
    
    func test_removeFirst_n() {
        var orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        
        orderedArray.removeFirst(3)
        
        XCTAssertEqual(orderedArray.data, [15, 20, 32, 49, 99])
    }
    
    func test_removeRange() {
        var orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        
        orderedArray.removeRange(2...5)
        
        XCTAssertEqual(orderedArray.data, [2, 3, 49, 99])
    }
    
    func test_removeAll() {
        var orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        
        orderedArray.removeAll()
        
        assertEmpty(orderedArray)
        XCTAssert(orderedArray.capacity == 0)
    }
    
    func test_removeAll_keepCapacity_false() {
        var orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        
        orderedArray.removeAll()
        
        assertEmpty(orderedArray)
        XCTAssert(orderedArray.capacity == 0)
    }
    
    func test_removeAll_keepCapacity_true() {
        var orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        
        orderedArray.removeAll(keepCapacity: true)
        
        assertEmpty(orderedArray)
        XCTAssertGreaterThanOrEqual(orderedArray.capacity, 7)
    }
    
    // MARK: ArrayLiteralConvertible
    
    func test_init_arrayLiteral() {
        let orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        
        XCTAssert(orderedArray.count == 8)
        XCTAssertEqual(orderedArray.data, [2, 3, 10, 15, 20, 32, 49, 99])
    }
    
    // MARK: Equatable
    
    func test_equalsOperator_equal() {
        let orderedArray1 = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        let orderedArray2 = OrderedArray<Int>(elements: [2, 3, 10, 15, 20, 32, 49, 99]) // TODO: Back to array literal
        
        XCTAssert(orderedArray1 == orderedArray2)
    }
    
    func test_equalsOperator_notEqual() {
        let orderedArray1 = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        let orderedArray2 = OrderedArray<Int>(elements: [2, 3, 10, 15, 20, 32, 49]) // TODO: Back to array literal
        
        XCTAssert(orderedArray1 != orderedArray2)
    }
    
    func test_equalsOperator_notEqualDifferentPredicate() {
        let orderedArray1 = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        let orderedArray2 = OrderedArray<Int>(elements: orderedArray1, predicate: { $1 < $0 })
        
        XCTAssert(orderedArray1 != orderedArray2)
    }
    
    // MARK: CustomStringConvertible
    
    func test_description_empty() {
        let orderedArray = OrderedArray<Int>(elements: []) // TODO: Back to array literal
        
        XCTAssertEqual(orderedArray.description, orderedArray.data.description)
    }
    
    func test_description_notEmpty() {
        let orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        
        XCTAssertEqual(orderedArray.description, orderedArray.data.description)
    }
    
    // MARK: CustomDebugStringConvertible
    func test_debugDescription_empty() {
        let orderedArray = OrderedArray<Int>(elements: []) // TODO: Back to array literal
        
        XCTAssertEqual(orderedArray.debugDescription, orderedArray.data.debugDescription)
    }
    
    func test_debugDescription_notEmpty() {
        let orderedArray = OrderedArray<Int>(elements: [3, 10, 20, 32, 49, 15, 2, 99]) // TODO: Back to array literal
        
        XCTAssertEqual(orderedArray.debugDescription, orderedArray.data.debugDescription)
    }
}
