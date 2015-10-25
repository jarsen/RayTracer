//
//  VectorTests.swift
//  RayTracer
//
//  Created by Jason Larsen on 10/24/15.
//  Copyright © 2015 Heartbit. All rights reserved.
//

import XCTest
import RayTracer

class VectorTests: XCTestCase {

    func testVectorAddition() {
        let a = Vector(1, 2, 3)
        let b = Vector(4, 5, 6)
        let sum = a + b
        
        XCTAssertEqual(sum, Vector(5, 7, 9))
    }
    
    func testVectorSubtraction() {
        let a = Vector(1, 2, 3)
        let b = Vector(4, 5, 6)
        
        XCTAssertEqual(a - b, Vector(-3, -3, -3))
        XCTAssertEqual(b - a, Vector(3, 3, 3))
    }
    
    func testNegativeVector() {
        let a = Vector(1, 2, 3)
        
        XCTAssertEqual(-a, Vector(-1, -2, -3))
    }
    
    func testDotProduct() {
        let a = Vector(1, 2, 3)
        let b = Vector(4, 5, 6)
        
        XCTAssertEqual(a.dot(b), 32)
    }
    
    func testCrossProduct() {
        let a = Vector(2, 3, 4)
        let b = Vector(5, 6, 7)
        
        XCTAssertEqual(a.cross(b), Vector(-3, 6, -3))
    }
}