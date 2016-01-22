//
//  OrderedDictionaryIndex.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-19.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import Foundation

func ==(lhs: OrderedDictionaryIndex, rhs: OrderedDictionaryIndex) -> Bool
{
    return lhs.index == rhs.index
}

// NOTE: This is a utility class for OrderedDictionary, this is necessary because if we used Int directly as the Index
// type then we wouldn't be able to have a subscript overload for returning the TValue
struct OrderedDictionaryIndex : ForwardIndexType, RandomAccessIndexType {
    let index: Int
    init(_ index: Int) {
        self.index = index
    }
    
    // MARK: - Protocols
    // MARK: ForwardIndexType
    func successor() -> OrderedDictionaryIndex {
        return OrderedDictionaryIndex(self.index.successor())
    }
    
    // MARK: RandomAccessIndexType
    @warn_unused_result
    func distanceTo(other: OrderedDictionaryIndex) -> OrderedDictionaryIndex.Distance {
        return self.index.distanceTo(other.index)
    }
    @warn_unused_result
    func advancedBy(n: OrderedDictionaryIndex.Distance) -> OrderedDictionaryIndex {
        return OrderedDictionaryIndex(self.index.advancedBy(n))
    }
    @warn_unused_result
    func advancedBy(n: OrderedDictionaryIndex.Distance, limit: OrderedDictionaryIndex) -> OrderedDictionaryIndex {
        return OrderedDictionaryIndex(self.index.advancedBy(n, limit: limit.index))
    }
    // MARK: BidirectionalIndexType
    @warn_unused_result
    func predecessor() -> OrderedDictionaryIndex {
        return OrderedDictionaryIndex(self.index - 1)
    }
}