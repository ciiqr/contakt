//
//  UIColor+hex.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-19.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import XCTest

class UIColor_hex_Tests: XCTestCase
{
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
        XCTAssertEqualWithAccuracy(red, CGFloat(r) / CGFloat(0xFF), accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(green, CGFloat(g) / CGFloat(0xFF), accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(blue, CGFloat(b) / CGFloat(0xFF), accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(alpha, CGFloat(a) / CGFloat(0xFF), accuracy: CGFloat(FLT_EPSILON))
    }
    
    private func testColour(hex hex: Int, r: Int, g: Int, b: Int)
    {
        testHexColour(UIColor(hex: hex), r, g, b, 0xFF)
    }
    
    private func testColour(hexAlpha hexAlpha: Int64, r: Int, g: Int, b: Int, a: Int)
    {
        testHexColour(UIColor(hexAlpha: hexAlpha), r, g, b, a)
    }

    // TODO: Should implement some tests with colour values other than 0 and 255...
    func test_init_hex() {
        testColour(hex: 0xFF0000, r: 0xFF, g: 0x00, b: 0x00) // Red
        testColour(hex: 0x00FF00, r: 0x00, g: 0xFF, b: 0x00) // Green
        testColour(hex: 0x0000FF, r: 0x00, g: 0x00, b: 0xFF) // Blue
        testColour(hex: 0x000000, r: 0x00, g: 0x00, b: 0x00) // Black
        testColour(hex: 0xFFFFFF, r: 0xFF, g: 0xFF, b: 0xFF) // White
        
        testColour(hex: 0x882288, r: 0x88, g: 0x22, b: 0x88)
        testColour(hex: 0xC6D358, r: 0xC6, g: 0xD3, b: 0x58)
    }
    
    func test_init_hexAlpha() {
        // hexAlpha alpha 0
        testColour(hexAlpha: 0xFF000000, r: 0xFF, g: 0x00, b: 0x00, a: 0x00) // Red
        testColour(hexAlpha: 0x00FF0000, r: 0x00, g: 0xFF, b: 0x00, a: 0x00) // Green
        testColour(hexAlpha: 0x0000FF00, r: 0x00, g: 0x00, b: 0xFF, a: 0x00) // Blue
        testColour(hexAlpha: 0x00000000, r: 0x00, g: 0x00, b: 0x00, a: 0x00) // Black
        testColour(hexAlpha: 0xFFFFFF00, r: 0xFF, g: 0xFF, b: 0xFF, a: 0x00) // White
        
        testColour(hexAlpha: 0x88228800, r: 0x88, g: 0x22, b: 0x88, a: 0x00)
        testColour(hexAlpha: 0xC6D35800, r: 0xC6, g: 0xD3, b: 0x58, a: 0x00)
        
        // hexAlpha alpha 0xFF
        testColour(hexAlpha: 0x000000FF, r: 0x00, g: 0x00, b: 0x00, a: 0xFF) // Black
        testColour(hexAlpha: 0xFF0000FF, r: 0xFF, g: 0x00, b: 0x00, a: 0xFF) // Red
        testColour(hexAlpha: 0x00FF00FF, r: 0x00, g: 0xFF, b: 0x00, a: 0xFF) // Green
        testColour(hexAlpha: 0x0000FFFF, r: 0x00, g: 0x00, b: 0xFF, a: 0xFF) // Blue
        testColour(hexAlpha: 0xFFFFFFFF, r: 0xFF, g: 0xFF, b: 0xFF, a: 0xFF) // White
        
        testColour(hexAlpha: 0x882288FF, r: 0x88, g: 0x22, b: 0x88, a: 0xFF)
        testColour(hexAlpha: 0xC6D358FF, r: 0xC6, g: 0xD3, b: 0x58, a: 0xFF)
    }
}
