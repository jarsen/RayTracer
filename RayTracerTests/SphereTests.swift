//
//  SphereTests.swift
//  RayTracer
//
//  Created by Jason Larsen on 10/24/15.
//  Copyright © 2015 Heartbit. All rights reserved.
//

import XCTest
import RayTracer

class SphereTests: XCTestCase {

    func testNormal() {
        let sphere = Sphere(radius: 1)
        let actual = sphere.normal(Point(1,0,0))
        let expected = Vector(1,0,0)
        XCTAssertEqual(actual, expected)
    }

}
