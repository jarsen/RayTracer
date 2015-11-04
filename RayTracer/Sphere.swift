//
//  Sphere.swift
//  RayTracer
//
//  Created by Jason Larsen on 10/24/15.
//  Copyright © 2015 Heartbit. All rights reserved.
//

import Foundation
import GLKit

public struct Sphere : Traceable {
    public var center: Point
    public var radius: Double
    public var material: Material
    
    public init(center: Point = Point.Zero, radius: Double = 0, material: Material) {
        self.center = center
        self.radius = radius
        self.material = material
    }
    
    public func intersect(ray: Ray) -> (point: Point, normal: Vector)? {
        // Calculate B & C of the quadtratic
        let B = 2 * ray.direction ∘ (ray.origin - center)
        let oc = ray.origin - center
        let C = (oc ∘ oc) - (radius * radius)
        
        // Calculate the discriminant
        let D = B * B - 4 * C
        if D < 0 {
            return nil
        }
    
        let t: Double
        
        // calculate smaller intersection parameter: t0
        let t0 = (-B - sqrt(D)) / 2
        if t0 <= 0 {
            // calculate larger t-value: t1
            let t1 = (-B + sqrt(D)) / 2
            if t1 <= 0 {
                return nil // intersection point behind ray
            }
            t = t1
        }
        else {
            t = t0
        }
     
        let point = ray.origin + ray.direction * t
        let normal = (point - center) / radius
        
        return (point, normal)
    }
}
