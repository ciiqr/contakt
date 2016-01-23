//
//  OrderedArray.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-20.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import Foundation

protocol OrderedArrayProto : CollectionType, MutableSliceable, Equatable
{
    // MARK: - Types
    typealias Element: Equatable
    typealias Predicate = (Element, Element) -> Bool
    typealias Index = Int
    
    // MARK: - Properties
    // MARK: Instance
    var data: [Element] { get }
    var predicate: Predicate { get set }
    
    // MARK: - Constructors
    init(predicate: Predicate)
    init(minimumCapacity: Int, predicate: Predicate)
    init(elements: Element..., predicate: Predicate)
    init<U: SequenceType where U.Generator.Element == Element>(elements: U, predicate: Predicate)
    
    // MARK: - Methods
    mutating func append(value: Element)
    mutating func reserveCapacity(n: Int)
}

extension OrderedArrayProto
{
    // TODO: Figure out why no matter what I try to implement here, it fails with a segfault...
}

// TODO: Clean this up and remove duplication
// TODO: Ugh, swift doesn't support the generic type constraints I would need in order to ensure a OrderedArray<T: Equatable> specialization only applies to types which are Equatable but not Comparable. I guess I'll just have to move most of the code to a protocol extension for a special protocol that they both implement...
struct OrderedArrayEquatable<T: Equatable> : OrderedArrayProto
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
    
    // MARK: - Methods
    @warn_unused_result
    func binarySearch(forValue value: Element) -> Index {
        return self.data.binarySearch { self.predicate($0, value) }
    }
    // TODO: Consider making this public
    private func indexMatches(index: Index, value: Element) -> Bool {
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
            replaceRange(bounds, with: values)
        }
    }
    
    // MARK: RangeReplaceableCollectionType
    mutating func replaceRange<C : CollectionType where C.Generator.Element == Element>(subRange: Range<Index>, with newElements: C) {
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
        assert(index == binarySearch(forValue: value), "You tried to insert a value into an OrderedArrayEquatable but at the wrong position")
        
        // If it's already in the data, assign a new value
        if self.indexMatches(index, value: value) {
            data[index] = value
        }
        else // else, insert at the given index
        {
            self.data.insert(value, atIndex: index)
        }
    }
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
    mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        self.data.removeAll(keepCapacity: keepCapacity)
    }
}

struct OrderedArray<T: Comparable> : OrderedArrayProto, RangeReplaceableCollectionType, ArrayLiteralConvertible
{
    // MARK: - Types
    typealias Element = T
    typealias Predicate = (Element, Element) -> Bool
    
    // MARK: - Properties
    // MARK: Instance
    var data = [Element]()
    var predicate: Predicate  = { $0 < $1 }
    {
        didSet {
            self.data.sortInPlace { self.predicate($0, $1) }
        }
    }
    // MARK: Calculated
    var capacity: Int {
        return self.data.capacity
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
    init(elements: Element..., predicate: Predicate) {
        self.init(elements: elements, predicate: predicate)
    }
    init<U: SequenceType where U.Generator.Element == Element>(elements: U, predicate: Predicate = { $0 < $1 }) {
        self.predicate = predicate
        // The input is likely not ordered, so we must insert one by one...
        // NOTE: if a key is duplicated, we use the last value
        for value in elements {
            self.append(value)
        }
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
    mutating func replaceRange<C : CollectionType where C.Generator.Element == Element>(subRange: Range<Index>, with newElements: C) {
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
        assert(index == binarySearch(forValue: value), "You tried to insert a value into an OrderedArray but at the wrong position")
        
        // If it's already in the data, assign a new value
        if self.indexMatches(index, value: value) {
            data[index] = value
        }
        else // else, insert at the given index
        {
            self.data.insert(value, atIndex: index)
        }
    }
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
    mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        self.data.removeAll(keepCapacity: keepCapacity)
    }
    
    // MARK: ArrayLiteralConvertible
    init(arrayLiteral elements: Element...) {
        self.init(elements: elements)
    }
}

func == <T: Equatable>(lhs: OrderedArray<T>, rhs: OrderedArray<T>) -> Bool
{
    // NOTE: If the 2 arrays have different predicates that result in the same sort order and otherwise have the same elements, they're considered equal
    return lhs.data == rhs.data
}

// TODO: Maybe print the predicate aswell?
extension OrderedArray : CustomStringConvertible, CustomDebugStringConvertible {
    var description: String {
        return self.data.debugDescription
    }
    var debugDescription: String {
        return self.data.description
    }
}

func == <T: Equatable>(lhs: OrderedArrayEquatable<T>, rhs: OrderedArrayEquatable<T>) -> Bool
{
    return lhs.data == rhs.data
}

extension OrderedArrayEquatable : CustomStringConvertible, CustomDebugStringConvertible {
    var description: String {
        return self.data.debugDescription
    }
    var debugDescription: String {
        return self.data.description
    }
}
