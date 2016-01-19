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
    static func async(handler: () -> Void)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), handler)
    }
    
    static func main(handler: () -> Void)
    {
        dispatch_async(dispatch_get_main_queue(), handler)
    }
}