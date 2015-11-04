//
//  TriangleTests.swift
//  RayTracer
//
//  Created by Jason Larsen on 10/31/15.
//  Copyright © 2015 Heartbit. All rights reserved.
//

import XCTest
@testable import RayTracer

class PolygonTests: XCTestCase {
    
    func testRayPlaneIntersectionThroughOrigin() {
        let triangle = Polygon(points: [Point(0, 0, 0), Point(0, 1, 0), Point(1,1,0)], material: .Reflective(color: Color(1,1,1)))
        var originRay = Ray(type: .Primary)
        originRay.origin = Point(0,0,1)
        originRay.direction = Vector(0,0,-1)
        let (actualIntersection, actualNormal) = triangle.planeIntersection(originRay)!
        let (expectedIntersection, expectedNormal) = (Point(0,0,0), Vector(0,0,1))
        XCTAssertEqual(actualIntersection, expectedIntersection)
        XCTAssertEqual(actualNormal, expectedNormal)
    }
    
    func testRayPlaneThroughOrigin2() {
        let triangle = Polygon(points: [Point(0, 0, 0), Point(1, 1, 1), Point(1,0,1)], material: .Reflective(color: Color(1,1,1)))
        var originRay = Ray(type: .Primary)
        originRay.origin = Point(0,0,1)
        originRay.direction = Vector(0,0,-1)
        let (actualIntersection, _) = triangle.planeIntersection(originRay)!
        let expectedIntersection = Point(0,0,0)
        XCTAssertEqual(actualIntersection, expectedIntersection)
    }

    func testRayPlaneIntersection1() {
        let triangle = Polygon(points: [Point(0, 0, 0), Point(1, 1, 1), Point(1,0,1)], material: .Reflective(color: Color(1,1,1)))
        var originRay = Ray(type: .Primary)
        originRay.origin = Point(0,0,1)
        originRay.direction = Vector(1,0,0)
        let (actualIntersection, _) = triangle.planeIntersection(originRay)!
        let expectedIntersection = Point(1,0,1)
        XCTAssertEqual(actualIntersection, expectedIntersection)
    }

    func testRayPolygonIntersectionMisses1() {
        let triangle = Polygon(points: [Point(0, 0, 0), Point(0, 1, 0), Point(1,1,0)], material: .Reflective(color: Color(1,1,1)))
        var originRay = Ray(type: .Primary)
        originRay.origin = Point(0,0,1)
        originRay.direction = Vector(0,-1,0)
        let answer = triangle.planeIntersection(originRay)
        XCTAssertNil(answer)
    }
    
    func testRayPolygonIntersectionMisses2() {
        let triangle = Polygon(points: [Point(-1, -1, 0), Point(0, 1, 0), Point(1,-1,0)], material: .Reflective(color: Color(1,1,1)))
        var originRay = Ray(type: .Primary)
        originRay.origin = Point(0,5,1)
        originRay.direction = Vector(0,0,-1)
        let answer = triangle.intersect(originRay)
        XCTAssertNil(answer)
    }

    func testPointInPolygonFromSlide() {
        let triangle = Polygon(points: [Point(-3, -3, 7), Point(3, -4, 3), Point(4, -5, 4)], material: .Reflective(color: Color(1,1,1)))
        let intersectionPoint = Point(-2, -2, 4)
        let normal = Vector(5, 10, 5)
        XCTAssertFalse(triangle.containsPoint(intersectionPoint, normal: normal))
    }
    
    func testRayPolygonIntersectionThroughOrigin() {
        let triangle = Polygon(points: [Point(-1, -1, 0), Point(0, 1, 0), Point(1,-1,0)], material: .Reflective(color: Color(1,1,1)))
        var originRay = Ray(type: .Primary)
        originRay.origin = Point(0,0,1)
        originRay.direction = Vector(0,0,-1)
        guard let (actualIntersection, actualNormal) = triangle.intersect(originRay) else {
            XCTFail()
            return
        }
        let (expectedIntersection, expectedNormal) = (Point(0,0,0), Vector(0,0,1))
        XCTAssertEqual(actualIntersection, expectedIntersection)
        XCTAssertEqual(actualNormal, expectedNormal)
    }

//    func testRayPolygonIntersection1() {
//        let triangle = Polygon(points: [Point(0, 0, 0), Point(0, 1, 0), Point(1,1,0)], material: .Reflective(color: Color(1,1,1)))
//        var originRay = Ray(type: .Primary)
//        originRay.origin = Point(0.2,0.2,1)
//        originRay.direction = Vector(0,0,-1)
//        guard let (actualIntersection, actualNormal) = triangle.intersect(originRay) else {
//            XCTFail()
//            return
//        }
//        
//        let (expectedIntersection, expectedNormal) = (Point(0.3,0.3,0), Vector(0,0,1))
//        XCTAssertEqual(actualIntersection, expectedIntersection)
//        XCTAssertEqual(actualNormal, expectedNormal)
//    }

}

