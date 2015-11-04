//
//  Ray.swift
//  RayTracer
//
//  Created by Jason Larsen on 10/24/15.
//  Copyright © 2015 Heartbit. All rights reserved.
//

import GLKit

public struct Ray : CustomStringConvertible {
    public enum Type : CustomStringConvertible {
        case Primary
        case Reflection
        case Transmission
        case Shadow
        
        public var description: String {
            switch self {
             case .Primary: return "Primary"
            case .Reflection: return "Reflection"
            case .Transmission: return "Transmission"
            case .Shadow: return "Shadow"
            }
        }
    }
    
    public var type: Type
    public var origin: Point
    public var direction: Vector
    
    public init(type: Type, origin: Point = Point.Zero, direction: Vector = Vector.Zero) {
        self.type = type
        self.origin = origin
        self.direction = direction
    }
    
    public var description: String {
        return "\(type). Origin: \(origin). Direction: \(direction)"
    }
}
