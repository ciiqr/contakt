//
//  Dispatch.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-18.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import Foundation

class Dispatch
{
    // TODO: Should have a few more functions to account for the intricacies of gcd
    // INFO: Read "Queue Types" from http://www.raywenderlich.com/79149/grand-central-dispatch-tutorial-swift-part-1
    
    static func async(handler: () -> Void)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), handler)
    }
    
    static func main(handler: () -> Void)
    {
        dispatch_async(dispatch_get_main_queue(), handler)
    }
}