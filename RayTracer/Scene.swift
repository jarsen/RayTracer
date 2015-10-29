//
//  Scene.swift
//  RayTracer
//
//  Created by Jason Larsen on 10/27/15.
//  Copyright © 2015 Heartbit. All rights reserved.
//

import Cocoa

public struct Viewport {
    public var umin: Double
    public var umax: Double
    public var vmin: Double
    public var vmax: Double
    
    public init(umin: Double, umax: Double, vmin: Double, vmax: Double) {
        self.umin = umin
        self.umax = umax
        self.vmin = vmin
        self.vmax = vmax
    }
}

public struct Scene {
    public var objects = [Traceable]()
    public var lookFrom: Point = Point.Zero
    public var backgroundColor = NSColor.blueColor()
    public var viewport = Viewport(umin: -5, umax: 5, vmin: -5, vmax: 5)
    
    public init() {
        
    }
}