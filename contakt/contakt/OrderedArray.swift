//
//  OrderedArray.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-20.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import Foundation

// TODO: Clean this up and remove duplication
// TODO: Figure out a way to conform to RangeReplaceableCollectionType and ArrayLiteralConvertible (NOTE: This should be fixed in future version of Swift, it's just that currently it doesn't support conditional inheritance of a protocol or any other features that would allow for similar flexibility)
struct OrderedArray<T: Equatable> : CollectionType, MutableSliceable, Equatable
{
    // MARK: - Types
    typealias Element = T
    typealias Predicate = (Element, Element) -> Bool
    
    // MARK: - Properties
    // MARK: Instance
    var data = [Element]() // TODO: Though, I would prefer this had a private setter...
    var predicate: Predicate {
        didSet {
            self.data.sortInPlace { self.predicate($0, $1) }
        }
    }
    // MARK: Calculated
    var capacity: Int {
        return self.data.capacity
    }
    
    // MARK: - Constructors
    init(predicate: Predicate) {
        self.predicate = predicate
    }
    init(minimumCapacity: Int, predicate: Predicate) {
        self.data.reserveCapacity(minimumCapacity)
        self.predicate = predicate
    }
    init(elements: Element..., predicate: Predicate) {
        self.init(elements: elements, predicate: predicate)
    }
    init<U: SequenceType where U.Generator.Element == Element>(elements: U, predicate: Predicate) {
        self.predicate = predicate
        // The input is likely not ordered, so we must insert one by one...
        // NOTE: if a key is duplicated, we use the last value
        for value in elements {
            self.append(value)
        }
    }
    init(count: Int, repeatedValue: Element, predicate: Predicate) {
        self.data = [Element](count: count, repeatedValue: repeatedValue)
        self.predicate = predicate
    }
    
    // MARK: - Methods
    @warn_unused_result
    func binarySearch(forValue value: Element) -> Index {
        return self.data.binarySearch { self.predicate($0, value) }
    }
    // TODO: Consider making this public
    private func indexMatches(index: Index, value: Element) -> Bool {
        return index < self.data.count && self.data[index] == value
    }
    //
    mutating func popLast() -> Element? {
        return self.data.popLast()
    }
    mutating func removeLast() -> Element {
        return self.data.removeLast()
    }
    
    // MARK: - Protocols
    
    // MARK: CollectionType
    /// A type that represents a valid position in the collection.
    typealias Index = Int
    /// The position of the first element in a non-empty collection.
    var startIndex: Index {
        return data.count == 0 ? endIndex : 0
    }
    /// The collection's "past the end" position.
    var endIndex: Index {
        return data.count
    }
    
    // MARK: MutableCollectionType
    typealias SubSequence = ArraySlice<Element>
    subscript (position: Index) -> Element {
        get {
            return self.data[position]
        }
        set(value) {
            self.data[position] = value
        }
    }
    subscript (bounds: Range<Index>) -> SubSequence {
        get {
            return self.data[bounds]
        }
        set(values) {
            replaceRange(bounds, with: values)
        }
    }
    
    // MARK: RangeReplaceableCollectionType
    mutating func replaceRange<C : CollectionType where C.Generator.Element == Element>
        (subRange: Range<Index>, with newElements: C)
    {
        // Remove the values in the given range
        self.removeRange(subRange)
        
        // Append the new values into the array
        self.appendContentsOf(newElements)
    }
    mutating func reserveCapacity(n: Int) {
        self.data.reserveCapacity(n)
    }
    mutating func append(value: Element) {
        let index = self.binarySearch(forValue: value)
        
        insert(value, atIndex: index)
    }
    mutating func appendContentsOf<S : SequenceType where S.Generator.Element == Element>(newElements: S) {
        for element in newElements {
            append(element)
        }
    }
    mutating func insert(value: Element, atIndex index: Index) {
        assert(index == binarySearch(forValue: value),
            "You tried to insert a value into an OrderedArray but at the wrong position")
        
        // If it's already in the data, assign a new value
        if self.indexMatches(index, value: value) {
            data[index] = value
        }
        else // else, insert at the given index
        {
            self.data.insert(value, atIndex: index)
        }
    }
    mutating func insertContentsOf<S : CollectionType where S.Generator.Element == Element>(newElements: S, at i: Index)
    {
        var elementInsertIndex = i
        
        // Insert each element at the appropriate index
        for element in newElements {
            insert(element, atIndex: elementInsertIndex)
            
            // Increment element insert index for next element
            elementInsertIndex += 1
        }
    }
    mutating func removeAtIndex(i: Index) -> Element {
        return self.data.removeAtIndex(i)
    }
    mutating func removeFirst() -> Element {
        return self.data.removeFirst()
    }
    mutating func removeFirst(n: Int) {
        self.data.removeFirst(n)
    }
    mutating func removeRange(subRange: Range<Index>) {
        self.data.removeRange(subRange)
    }
    mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        self.data.removeAll(keepCapacity: keepCapacity)
    }
}

func == <T: Equatable>(lhs: OrderedArray<T>, rhs: OrderedArray<T>) -> Bool
{
    return lhs.data == rhs.data
}

extension OrderedArray : CustomStringConvertible, CustomDebugStringConvertible {
    var description: String {
        return self.data.debugDescription
    }
    var debugDescription: String {
        return self.data.description
    }
}

extension OrderedArray where T: Comparable
{
    init() {
        self.init() { $0 < $1 }
    }
    init(minimumCapacity: Int) {
        self.init(minimumCapacity: minimumCapacity) { $0 < $1 }
    }
    init<U: SequenceType where U.Generator.Element == Element>(elements: U) {
        self.init(elements: elements) { $0 < $1 }
    }
    init(count: Int, repeatedValue: Element) {
        self.init(count: count, repeatedValue: repeatedValue) { $0 < $1 }
    }
    
    // MARK: ArrayLiteralConvertible
    init(arrayLiteral elements: Element...) {
        self.init(elements: elements) { $0 < $1 }
    }
}