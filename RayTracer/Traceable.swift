//
//  Traceable.swift
//  RayTracer
//
//  Created by Jason Larsen on 10/24/15.
//  Copyright © 2015 Heartbit. All rights reserved.
//

import Cocoa

public protocol Traceable {
    var material: Material { get }
    func intersect(ray: Ray) -> Point?
    func normal(point: Point) -> Vector
}
