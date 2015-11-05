//
//  Scene.swift
//  RayTracer
//
//  Created by Jason Larsen on 10/27/15.
//  Copyright © 2015 Heartbit. All rights reserved.
//

import Cocoa

public struct DirectionalLightSource {
    var direction: Vector /// Direction to the light source
    var color: Color
    
    public init(direction: Vector, color: Color) {
        self.direction = direction.normalized()
        self.color = color
    }
}

public struct Scene {
    public var objects = [Traceable]()
    public let lookFrom: Point
    public var backgroundColor = Color(0, 0, 0)
    public let fieldOfView: Double
    public var viewport: (umin: Double, umax: Double, vmin: Double, vmax: Double)
    public var ambientLight = Color(0.1, 0.1, 0.1)
    public var lightSources = [DirectionalLightSource]()
    
    
    
    public init(lookFrom: Point, fieldOfView: Double) {
        self.lookFrom = lookFrom
        self.fieldOfView = fieldOfView
        
        let length = lookFrom.length()
        let halfAngle = fieldOfView / 2
        let x = length * tan(halfAngle * Double(M_PI) / 180)
        viewport = (-x, x, -x, x)
    }
}