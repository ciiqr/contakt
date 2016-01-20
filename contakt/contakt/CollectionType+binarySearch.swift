//
//  CollectionType+binarySearch.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-19.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import Foundation

extension CollectionType where Index: RandomAccessIndexType
{
    // TODO: Unit testing
    // NOTE: Swift implementation details thanks to: https://stackoverflow.com/a/33674192
    @warn_unused_result
    func binarySearch(withPredicate predicate: (Generator.Element) -> Bool) -> Index {
        var low = startIndex
        var high = endIndex
        // Once low is high there's nowhere else to go, we must be at the location the predicate is looking for
        while low != high {
            // NOTE: This uses the proper algorithm for finding the midpoint, not Bentley's broken midpoint
            // mid = low + ((high - low) / 2)
            let mid = low.advancedBy(low.distanceTo(high) / 2)
            // it's in the upper half
            if predicate(self[mid]) {
                // low = mid + 1
                low = mid.advancedBy(1)
            }
            else { // it's in the lower half
                high = mid
            }
        }
        return low
    }
}
