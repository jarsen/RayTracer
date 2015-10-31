//
//  Material.swift
//  RayTracer
//
//  Created by Jason Larsen on 10/29/15.
//  Copyright © 2015 Heartbit. All rights reserved.
//

import Cocoa

public enum Material {
    case Diffuse(color: Color, specularHighlight: Color, phongConstant: Double)
    case Reflective(color: Color)
//    case Transparent(Color)
    
    public var color: Color {
        switch self {
        case let .Diffuse(color, _, _): return color
        case let .Reflective(color): return color
        }
    }
}