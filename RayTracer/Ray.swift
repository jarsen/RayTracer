//
//  Ray.swift
//  RayTracer
//
//  Created by Jason Larsen on 10/24/15.
//  Copyright © 2015 Heartbit. All rights reserved.
//

import GLKit

public struct Ray {
    public enum Type {
        case Primary
        case Reflection
        case Transmission
        case Shadow
    }
    
    public var origin: Point = Vector.Zero
    public var direction = Vector.Zero
    public var type: Type
    
    init(type: Type) {
        self.type = type
    }
}
