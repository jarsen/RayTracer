//
//  Vector.swift
//  RayTracer
//
//  Created by Jason Larsen on 10/24/15.
//  Copyright © 2015 Heartbit. All rights reserved.
//

import GLKit

public struct Vector : Equatable {
    public var x: Double
    public var y: Double
    public var z: Double
    
    public init(_ x: Double, _ y: Double, _ z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    public func dot(vector: Vector) -> Double {
        return (x * vector.x) + (y * vector.y) + (z * vector.z)
    }
    
    public func cross(vector: Vector) -> Vector {
        return Vector(y * vector.z - z * vector.y, z * vector.x - x * vector.z, x * vector.y - y * vector.x)
    }
    
    public static var Zero : Vector {
        get {
            return Vector(0, 0, 0)
        }
    }
    
    public func length() -> Double {
        return sqrt(x * x + y * y + z * z)
    }
    
    public func normalized() -> Vector {
        return self / length()
    }
}

public typealias Point = Vector

public func + (left: Vector, right: Vector) -> Vector {
    return Vector(left.x + right.x, left.y + right.y, left.z + right.z)
}

public func - (left: Vector, right: Vector) -> Vector {
    return Vector(left.x - right.x, left.y - right.y, left.z - right.z)
}

public prefix func - (vector: Vector) -> Vector {
    return Vector.Zero - vector
}

public func == (left: Vector, right: Vector) -> Bool {
    return left.x == right.x && left.y == right.y && left.z == right.z
}

public func * (left: Double, right: Vector) -> Vector {
    return Vector(left * right.x, left * right.y, left * right.z)
}

public func * (left: Vector, right: Double) -> Vector {
    return Vector(right * left.x, right * left.y, right * left.z)
}

public func * (left: Vector, right: Vector) -> Double {
    return left.dot(right)
}

public func / (left: Vector, right: Double) -> Vector {
    return Vector(left.x / right, left.y / right, left.z / right)
}

infix operator × {
    associativity left
    precedence 155
}

public func × (left: Vector, right: Vector) -> Vector {
    return left.cross(right)
}