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

struct RayTracer {
    var items = [Traceable]()
    
    func trace(imageSize: NSSize, camera: Point) -> NSImage {
        let pixelsWide = Int(imageSize.width)
        let pixelsHigh = Int(imageSize.height)
    
        guard let bitmap = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: pixelsWide, pixelsHigh: pixelsHigh, bitsPerSample: 8, samplesPerPixel: 3, hasAlpha: false, isPlanar: false, colorSpaceName: NSCalibratedRGBColorSpace, bytesPerRow: 0, bitsPerPixel: 0) else {
            fatalError("Error creating bitmap image")
        }
        
        for x in 0..<pixelsWide {
            for y in 0..<pixelsHigh {
                bitmap.setColor(.redColor(), atX: x, y: y)
            }
        }
        
        let image = NSImage(size: imageSize)
        image.addRepresentation(bitmap)
        return image
    }
}