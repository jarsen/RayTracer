//
//  RayTracer.swift
//  RayTracer
//
//  Created by Jason Larsen on 10/26/15.
//  Copyright © 2015 Heartbit. All rights reserved.
//

import Cocoa

extension NSColor {
    var intValue: UInt {
        get {
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            getRed(&r, green: &g, blue: &b, alpha: nil)
            return (UInt(r) << 16) | (UInt(g) << 8) | UInt(b)
        }
    }
}

public struct RayTracer {
    public func trace(imageSize: NSSize, scene: Scene) -> NSImage {
        let pixelsWide = Int(imageSize.width)
        let pixelsHigh = Int(imageSize.height)
    
        guard let bitmap = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: pixelsWide, pixelsHigh: pixelsHigh, bitsPerSample: 8, samplesPerPixel: 3, hasAlpha: false, isPlanar: false, colorSpaceName: NSCalibratedRGBColorSpace, bytesPerRow: 0, bitsPerPixel: 0) else {
            fatalError("Error creating bitmap image")
        }
        
        for x in 0..<pixelsWide {
            for y in 0..<pixelsHigh {
                let pixelColor: NSColor
                let ray = primaryRayForPixel(imageSize, x: x, y: y, scene: scene)
                if let (point, object) = nearestIntersection(ray, scene: scene) {
                    pixelColor = object.color
                    let _ = point
                }
                else {
                    pixelColor = scene.backgroundColor
                }
                bitmap.setColor(pixelColor, atX: x, y: y)
            }
        }
        
        let image = NSImage(size: imageSize)
        image.addRepresentation(bitmap)
        return image
    }
    
    private func nearestIntersection(ray: Ray, scene: Scene) -> (Point, Traceable)? {
        var nearestPoint: Point?
        var shortestLength = Double.infinity
        var nearestObject: Traceable?

        for object in scene.objects {
            if let point = object.intersect(ray) {
                let length = (point - ray.origin).length()
                if length < shortestLength {
                    shortestLength = length
                    nearestPoint = point
                    nearestObject = object
                }
            }
        }
        
        if let nearestPoint = nearestPoint, nearestObject = nearestObject {
            return (nearestPoint, nearestObject)
        }
        return nil
    }
    
    private func primaryRayForPixel(imageSize: NSSize, x: Int, y: Int, scene: Scene) -> Ray {
        let halfHeight = Double(imageSize.height) / 2
        let halfWidth = Double(imageSize.width) / 2
        let screenPoint = Point(Double(x) - halfWidth, Double(y) - halfHeight, 0)
        var ray = Ray(type: .Primary)
        ray.origin = scene.lookFrom
        ray.direction = (screenPoint - scene.lookFrom).normalized()
        return ray
    }
}