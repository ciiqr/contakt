//
//  UIColor+hex.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-19.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import XCTest

class UIColor_hex: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    private func testHexColour(colour: UIColor, _ r: Int, _ g: Int, _ b: Int, _ a: Int)
    {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        // Get the individual colours
        XCTAssert(colour.getRed(&red, green: &green, blue: &blue, alpha: &alpha))
        // Compare against expected values
        // NOTE: Expected values come in as integers and converted to the applicable floats...
        XCTAssert(red == (CGFloat(r) / CGFloat(0xFF)))
        XCTAssert(green == (CGFloat(g) / CGFloat(0xFF)))
        XCTAssert(blue == (CGFloat(b) / CGFloat(0xFF)))
        XCTAssert(alpha == (CGFloat(a) / CGFloat(0xFF)))
    }
    
    private func testColour(hex hex: Int, r: Int, g: Int, b: Int)
    {
        testHexColour(UIColor(hex: hex), r, g, b, 0xFF)
    }
    
    private func testColour(hexAlpha hexAlpha: Int, r: Int, g: Int, b: Int, a: Int)
    {
        testHexColour(UIColor(hexAlpha: hexAlpha), r, g, b, a)
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // TODO: Should implement some tests with colour values other than 0 and 255...
        
        testColour(hex: 0xFF0000, r: 0xFF, g: 0, b: 0) // Red
        testColour(hex: 0x00FF00, r: 0, g: 0xFF, b: 0) // Green
        testColour(hex: 0x0000FF, r: 0, g: 0, b: 0xFF) // Blue
        testColour(hex: 0x000000, r: 0, g: 0, b: 0) // Black
        testColour(hex: 0xFFFFFF, r: 0xFF, g: 0xFF, b: 0xFF) // White
        
        // hexAlpha alpha 0
        testColour(hexAlpha: 0xFF000000, r: 0xFF, g: 0, b: 0, a: 0) // Red
        testColour(hexAlpha: 0x00FF0000, r: 0, g: 0xFF, b: 0, a: 0) // Green
        testColour(hexAlpha: 0x0000FF00, r: 0, g: 0, b: 0xFF, a: 0) // Blue
        testColour(hexAlpha: 0x00000000, r: 0, g: 0, b: 0, a: 0) // Black
        testColour(hexAlpha: 0xFFFFFF00, r: 0xFF, g: 0xFF, b: 0xFF, a: 0) // White
        
        // hexAlpha alpha 0xFF
        testColour(hexAlpha: 0x000000FF, r: 0, g: 0, b: 0, a: 0xFF) // Black
        testColour(hexAlpha: 0xFF0000FF, r: 0xFF, g: 0, b: 0, a: 0xFF) // Red
        testColour(hexAlpha: 0x00FF00FF, r: 0, g: 0xFF, b: 0, a: 0xFF) // Green
        testColour(hexAlpha: 0x0000FFFF, r: 0, g: 0, b: 0xFF, a: 0xFF) // Blue
        testColour(hexAlpha: 0xFFFFFFFF, r: 0xFF, g: 0xFF, b: 0xFF, a: 0xFF) // White
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
