//
//  Scene.swift
//  RayTracer
//
//  Created by Jason Larsen on 10/27/15.
//  Copyright © 2015 Heartbit. All rights reserved.
//

import Cocoa

struct Scene {
    var items = [Traceable]()
    var lookFrom: Point = Point.Zero
    var backgroundColor = NSColor.lightGrayColor()
}