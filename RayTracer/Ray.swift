//
//  Ray.swift
//  RayTracer
//
//  Created by Jason Larsen on 10/24/15.
//  Copyright © 2015 Heartbit. All rights reserved.
//

import GLKit

typealias Point = GLKVector3
typealias Vector = GLKVector3

enum Type {
    case Primary
    case Reflection
    case Transmission
    case Shadow
}

struct Ray {
    var origin: Point
    var direction: Vector
    var type: Type
}
