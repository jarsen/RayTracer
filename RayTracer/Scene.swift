//
//  Scene.swift
//  RayTracer
//
//  Created by Jason Larsen on 10/27/15.
//  Copyright © 2015 Heartbit. All rights reserved.
//

import Cocoa

public struct Scene {
    public var objects = [Traceable]()
    public var lookFrom: Point = Point.Zero
    public var backgroundColor = NSColor.blueColor()
    
    public init() {
        
    }
}