//
//  OrderedArray.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-20.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import Foundation

// TODO: Clean this up, remove duplication and implement unit tests
// TODO: Ugh, swift doesn't support the generic type constraints I would need in order to ensure a OrderedArray<T: Equatable> specialization only applies to types which are Equatable but not Comparable. I guess I'll just have to move most of the code to a protocol extension for a special protocol that they both implement...
struct OrderedArrayEquatable<T: Equatable> : CollectionType, MutableSliceable, Equatable
{
    // MARK: - Types
    typealias Element = T
    typealias Predicate = (T, T) -> Bool
    
    // MARK: - Instance Variables
    private var data = [Element]()
    var predicate: Predicate
        {
        didSet {
            self.data.sortInPlace { self.predicate($0, $1) }
        }
    }
    
    // MARK: - Constructors
    init(predicate: Predicate) {
        self.predicate = predicate
    }
    init(minimumCapacity: Int, predicate: Predicate) {
        self.data.reserveCapacity(minimumCapacity)
        self.predicate = predicate
    }
    // NOTE: Unfortunately there doesn't seem to be a way to pass a dictionaryLiteral when we have other parameters,
    // also, having the predicate first makes more sense here since it's often going to be shorter than the list of
    // kv-pairs.
    init(predicate: Predicate, elements: T...) {
        self.init(elements: elements, predicate: predicate)
    }
    init<U: SequenceType where U.Generator.Element == T>(elements: U, predicate: Predicate) {
        self.predicate = predicate
        // The input is likely not ordered, so we must insert one by one...
        // NOTE: if a key is duplicated, we use the last value
        for value in elements {
            self.append(value)
        }
    }
    
    // MARK: - Methods
    @warn_unused_result
    func binarySearch(forValue value: T) -> Index {
        return self.data.binarySearch { self.predicate($0, value) }
    }
    // TODO: Consider making this public
    private func indexMatches(index: Index, value: T) -> Bool {
        return index < self.data.count && self.data[index] == value
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
            // TODO: Ensure this is infact what it's supposed to be doing, because this is poorly documented
            replaceRange(bounds, with: values)
        }
    }
    
    // MARK: RangeReplaceableCollectionType
    mutating func replaceRange<C : CollectionType where C.Generator.Element == Element>(subRange: Range<Index>, with newElements: C) {
        // Remove the values in the given range
        self.data.removeRange(subRange)
        
        // Append the new values into the array
        self.data.appendContentsOf(newElements)
    }
    mutating func reserveCapacity(n: Index.Distance) {
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
        assert(index == binarySearch(forValue: value), "You tried to insert a value into an OrderedArrayEquatable but at the wrong position")
        
        // If it's already in the data, assign a new value
        if self.indexMatches(index, value: value) {
            data[index] = value
        }
        else { // else, insert at the given index
            self.data.insert(value, atIndex: index)
        }
    }
    // TODO: Test this...
    mutating func insertContentsOf<S : CollectionType where S.Generator.Element == Element>(newElements: S, at i: Index) {
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
    mutating func removeAll(keepCapacity keepCapacity: Bool) {
        self.data.removeAll(keepCapacity: keepCapacity)
    }
}

// TODO: test this
func == <T: Equatable>(lhs: OrderedArrayEquatable<T>, rhs: OrderedArrayEquatable<T>) -> Bool
{
    if lhs.count != rhs.count {
        return false
    }
    // NOTE: Since we're ordered, we can just iterate through and compare the values at the same indices
    for index in 0 ..< lhs.count {
        // If either the the values aren't equal, we're not equal
        if lhs.data[index] != rhs.data[index] {
            return false
        }
    }
    return true
}

extension OrderedArrayEquatable : CustomStringConvertible, CustomDebugStringConvertible {
    // NOTE: Implementation taken from the standard Dictionary's implementation: https://github.com/apple/swift/blob/master/stdlib/public/core/HashedCollections.swift.gyb#L1272
    var description: String {
        if count == 0 {
            return "[]"
        }
        
        var result = "["
        var first = true
        for v in self {
            if first {
                first = false
            } else {
                result += ", "
            }
            debugPrint(v, terminator: "", toStream: &result)
        }
        result += "]"
        return result
    }
    var debugDescription: String {
        return description
    }
}

struct OrderedArray<T: Comparable> : CollectionType, MutableSliceable, RangeReplaceableCollectionType, ArrayLiteralConvertible, Equatable
{
    // MARK: - Types
    typealias Predicate = (T, T) -> Bool
    
    // MARK: - Instance Variables
    private var data = [Element]()
    var predicate: Predicate  = { $0 < $1 }
    {
        didSet {
            self.data.sortInPlace { self.predicate($0, $1) }
        }
    }
    
    // MARK: - Constructors
    init() {}
    init(predicate: Predicate) {
        self.predicate = predicate
    }
    init(minimumCapacity: Int) {
        self.data.reserveCapacity(minimumCapacity)
    }
    init(minimumCapacity: Int, predicate: Predicate) {
        self.init(minimumCapacity: minimumCapacity)
        self.predicate = predicate
    }
    // NOTE: Unfortunately there doesn't seem to be a way to pass a dictionaryLiteral when we have other parameters,
    // also, having the predicate first makes more sense here since it's often going to be shorter than the list of
    // kv-pairs.
    init(predicate: Predicate, elements: T...) {
        self.init(elements: elements, predicate: predicate)
    }
    init<U: SequenceType where U.Generator.Element == T>(elements: U, predicate: Predicate = { $0 < $1 }) {
        self.predicate = predicate
        // The input is likely not ordered, so we must insert one by one...
        // NOTE: if a key is duplicated, we use the last value
        for value in elements {
            self.append(value)
        }
    }
    
    // MARK: - Methods
    @warn_unused_result
    func binarySearch(forValue value: T) -> Index {
        return self.data.binarySearch { self.predicate($0, value) }
    }
    // TODO: Consider making this public
    private func indexMatches(index: Index, value: T) -> Bool {
        return index < self.data.count && self.data[index] == value
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
            // TODO: Ensure this is infact what it's supposed to be doing, because this is poorly documented
            replaceRange(bounds, with: values)
        }
    }
    
    // MARK: RangeReplaceableCollectionType
    mutating func replaceRange<C : CollectionType where C.Generator.Element == Element>(subRange: Range<Index>, with newElements: C) {
        // Remove the values in the given range
        self.data.removeRange(subRange)
        
        // Append the new values into the array
        self.data.appendContentsOf(newElements)
    }
    mutating func reserveCapacity(n: Index.Distance) {
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
        assert(index == binarySearch(forValue: value), "You tried to insert a value into an OrderedArray but at the wrong position")
        
        // If it's already in the data, assign a new value
        if self.indexMatches(index, value: value) {
            data[index] = value
        }
        else { // else, insert at the given index
            self.data.insert(value, atIndex: index)
        }
    }
    // TODO: Test this...
    mutating func insertContentsOf<S : CollectionType where S.Generator.Element == Element>(newElements: S, at i: Index) {
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
    mutating func removeAll(keepCapacity keepCapacity: Bool) {
        self.data.removeAll(keepCapacity: keepCapacity)
    }
    
    // MARK: ArrayLiteralConvertible
    typealias Element = T
    init(arrayLiteral elements: Element...) {
        self.init(elements: elements)
    }
}

// TODO: test this
func == <T: Equatable>(lhs: OrderedArray<T>, rhs: OrderedArray<T>) -> Bool
{
    if lhs.count != rhs.count {
        return false
    }
    // NOTE: Since we're ordered, we can just iterate through and compare the values at the same indices
    for index in 0 ..< lhs.count {
        // If either the the values aren't equal, we're not equal
        if lhs.data[index] != rhs.data[index] {
            return false
        }
    }
    return true
}

extension OrderedArray : CustomStringConvertible, CustomDebugStringConvertible {
    // NOTE: Implementation taken from the standard Dictionary's implementation: https://github.com/apple/swift/blob/master/stdlib/public/core/HashedCollections.swift.gyb#L1272
    var description: String {
        if count == 0 {
            return "[]"
        }
        
        var result = "["
        var first = true
        for v in self {
            if first {
                first = false
            } else {
                result += ", "
            }
            debugPrint(v, terminator: "", toStream: &result)
        }
        result += "]"
        return result
    }
    var debugDescription: String {
        return description
    }
}