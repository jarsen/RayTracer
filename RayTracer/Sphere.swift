//
//  Sphere.swift
//  RayTracer
//
//  Created by Jason Larsen on 10/24/15.
//  Copyright © 2015 Heartbit. All rights reserved.
//

import Foundation
import GLKit

struct Sphere : Traceable {
    var center: Point
    var radius: Float
    
    func intersect(ray: Ray) -> Point? {
        return nil
    }
    
    func normal(point: Point) -> Vector {
        return GLKVector3Subtract(point, center)
    }
}
