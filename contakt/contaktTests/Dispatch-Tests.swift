//
//  Dispatch-Tests.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-24.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import XCTest

class Dispatch_Tests: XCTestCase
{
    func test_async_ensure_different_thread() {
        
        let expectation = self.expectationWithDescription("Dispatch.async()")
        let currentThread = NSThread.currentThread()
        
        Dispatch.async({
            XCTAssertNotEqual(currentThread, NSThread.currentThread())
            expectation.fulfill()
        })
        
        self.waitForExpectationsWithTimeout(1.0, handler: nil)
    }

    // TODO: Decide or find a reasonable way to test this...
//    func test_main_ensure_same_thread() {
//        let currentThread = NSThread.currentThread()
//        var mainThread: NSThread? = nil
//        
//        Dispatch.main({
//            mainThread = NSThread.currentThread()
//            XCTAssertEqual(currentThread, mainThread!)
//        })
//        
//    }
}
