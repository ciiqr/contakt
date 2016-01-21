//
//  OrderedDictionary.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-19.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import Foundation

// TODO: Clean this up, remove duplication and implement unit tests

struct OrderedDictionary<TKey: Comparable, TValue> : CollectionType, DictionaryLiteralConvertible
{
    // MARK: - Types
    typealias Element = (key: TKey, value: TValue)
    typealias Predicate = (TKey, TKey) -> Bool
    
    // MARK: - Instance Variables
    private var data = [Element]()
    var predicate: Predicate  = { $0 < $1 }
    {
        didSet {
            self.data.sortInPlace { (first, second) -> Bool in
                return self.predicate(first.key, second.key)
            }
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
    init(predicate: Predicate, elements: (TKey, TValue)...) {
        self.init(elements: elements, predicate: predicate)
    }
    // TODO: There doesn't seem to be a way right now to set a field before calling to another constructor...
    init<T: SequenceType where T.Generator.Element == (TKey, TValue)>(elements: T, predicate: Predicate = { $0 < $1 }) {
        self.predicate = predicate
        // The input is likely not ordered, so we must insert one by one...
        // NOTE: if a key is duplicated, we use the last value
        // TODO: Make sure I'm using this style everywhere it's applicable
        for (key, value) in elements {
            self[key] = value
        }
    }

    
    // MARK: - Methods
    @warn_unused_result
    func binarySearch(forKey key: TKey) -> Int {
        return self.data.binarySearch { self.predicate($0.key, key) }
    }
    // TODO: Consider making this public
    private func indexMatches(index: Int, key: TKey) -> Bool {
        return index < self.data.count && self.data[index].key == key
    }
    
    // MARK: Dictionary
    subscript (key: TKey) -> TValue? {
        get {
            let index = self.binarySearch(forKey: key)
            if self.indexMatches(index, key: key) {
                return data[index].value
            }
            return nil
        }
        set(newValue) {
            let index = self.binarySearch(forKey: key)
            
            if let value = newValue {
                // If it's already in the data, assign a new value
                if self.indexMatches(index, key: key) {
                    data[index].value = value
                }
                else { // else, insert at the given index
                    data.insert((key, value), atIndex: index)
                }
            }
            else { // Setting to null removes
                data.removeAtIndex(index)
            }
        }
    }
    /// Returns the `Index` for the given key, or `nil` if the key is not
    /// present in the dictionary.
    @warn_unused_result
    func indexForKey(key: TKey) -> OrderedDictionaryIndex?
    {
        let index = self.binarySearch(forKey: key)
        
        // If it's actually in the data, return the index
        if self.indexMatches(index, key: key) {
            return OrderedDictionaryIndex(index)
        }
        return nil
    }
    /// Update the value stored in the dictionary for the given key, or, if they
    /// key does not exist, add a new key-value pair to the dictionary.
    mutating func updateValue(value: TValue, forKey key: TKey) -> TValue?
    {
        let old = self[key]
        self[key] = value
        return old
    }
    /// Remove the key-value pair at `index`.
    mutating func removeAtIndex(index: OrderedDictionaryIndex) -> Element
    {
        return self.data.removeAtIndex(index.index)
    }
    
    /// Remove a given key and the associated value from the dictionary.
    mutating func removeValueForKey(key: TKey) -> TValue?
    {
        let index = self.binarySearch(forKey: key)
        
        // If it's in the data, remove and return the value
        if self.indexMatches(index, key: key) {
            return data.removeAtIndex(index).value
        }
        return nil
    }
    /// Remove all elements.
    mutating func removeAll(keepCapacity keepCapacity: Bool = false)
    {
        self.data.removeAll(keepCapacity: keepCapacity)
    }
    /// A collection containing just the keys of `self`.
    var keys: LazyMapCollection<OrderedDictionary<TKey, TValue>, TKey> {
        return LazyMapCollection<OrderedDictionary<TKey, TValue>, TKey>(self, transform: { (key, _) -> TKey in
            return key
        })
    }
    /// A collection containing just the values of `self`.
    var values: LazyMapCollection<OrderedDictionary<TKey, TValue>, TValue> {
        return LazyMapCollection<OrderedDictionary<TKey, TValue>, TValue>(self, transform: { (_, value) -> TValue in
            return value
        })
    }
    
    // MARK: - Protocols
    
    // MARK: CollectionType
    /// A type that represents a valid position in the collection.
    typealias Index = OrderedDictionaryIndex
    /// The position of the first element in a non-empty collection.
    var startIndex: Index {
        return data.count == 0 ? endIndex : OrderedDictionaryIndex(0)
    }
    /// The collection's "past the end" position.
    var endIndex: Index {
        return OrderedDictionaryIndex(data.count)
    }
    subscript (position: Index) -> Element {
        return data[position.index]
    }

    // MARK: DictionaryLiteralConvertible
    typealias Key = TKey
    typealias Value = TValue
    // Construct with a dictionary literal
    init(dictionaryLiteral elements: (Key, Value)...) {
        self.init(elements: elements)
    }
}

// TODO: test this
// NOTE: Since OrderedDictionaries value type won't always be Equatable, we only implement equals this if it is Equatable
func == <TKey: Equatable, TValue: Equatable>(lhs: OrderedDictionary<TKey, TValue>, rhs: OrderedDictionary<TKey, TValue>) -> Bool
{
    if lhs.count != rhs.count {
        return false
    }
    // NOTE: Since we're ordered, we can just iterate through and compare the keys and values at the same indices
    for index in 0 ..< lhs.count {
        let lhsPair = lhs.data[index]
        let rhsPair = rhs.data[index]
        // If either the key or the value aren't equal, we're not equal
        if lhsPair.key != rhsPair.key || lhsPair.value != rhsPair.value {
            return false
        }
    }
    return true
}

extension OrderedDictionary : CustomStringConvertible, CustomDebugStringConvertible {
    // NOTE: Implementation taken from the standard Dictionary's implementation: https://github.com/apple/swift/blob/master/stdlib/public/core/HashedCollections.swift.gyb#L1272
    var description: String {
        if count == 0 {
            return "[:]"
        }
        
        var result = "["
        var first = true
        for (k, v) in self {
            if first {
                first = false
            } else {
                result += ", "
            }
            debugPrint(k, terminator: "", toStream: &result)
            result += ": "
            debugPrint(v, terminator: "", toStream: &result)
        }
        result += "]"
        return result
    }
    var debugDescription: String {
        return description
    }
}