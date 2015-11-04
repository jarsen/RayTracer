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
        
        let halfWindowHeight = Double(imageSize.height) / 2
        let halfWindowWidth = Double(imageSize.width) / 2
        let xmin = -halfWindowWidth
        let xmax = halfWindowWidth
        let ymin = -halfWindowHeight
        let ymax = halfWindowHeight
        
        for x in 0..<pixelsWide {
            for y in 0..<pixelsHigh {
                let pixelColor: NSColor
                let ray = primaryRayForPixel(imageSize, scene: scene, x: x, y: y, xmin: xmin, xmax: xmax, ymin: ymin, ymax: ymax)
                if let (point, normal, object) = nearestIntersection(ray, scene: scene) {
                    pixelColor = illuminatedColorForPoint(point, normal: normal, object: object, scene: scene).nsColor()
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
    
    private func nearestIntersection(ray: Ray, scene: Scene) -> (Point, Vector, Traceable)? {
        var nearestPoint: Point?
        var nearestNormal: Vector?
        var shortestLength = Double.infinity
        var nearestObject: Traceable?

        for object in scene.objects {
            if let (point, normal) = object.intersect(ray) {
                let length = (point - ray.origin).length()
                if length < shortestLength {
                    shortestLength = length
                    nearestPoint = point
                    nearestNormal = normal
                    nearestObject = object
                }
            }
        }
        
        if let nearestPoint = nearestPoint,
            nearestNormal = nearestNormal,
            nearestObject = nearestObject {
                return (nearestPoint, nearestNormal, nearestObject)
        }
        return nil
    }
    
    private func primaryRayForPixel(imageSize: NSSize, scene: Scene, x: Int, y: Int, xmin: Double, xmax: Double, ymin: Double, ymax: Double) -> Ray {
        let invertY = ymax - Double(y)
        let u = (Double(x) - xmin) * ((scene.viewport.umax - scene.viewport.umin)/(xmax - xmin)) + scene.viewport.umin + scene.viewport.umin
        let v = (invertY - ymin) * ((scene.viewport.vmax - scene.viewport.vmin)/(ymax - ymin)) + scene.viewport.vmin
        
        let screenPoint = Point(u, v, 0)
        var ray = Ray(type: .Primary)
        ray.origin = scene.lookFrom
        ray.direction = (screenPoint - scene.lookFrom).normalized()
        return ray
    }
    
    private func isShadowed(ray: Ray, scene: Scene, lightSource: DirectionalLightSource) -> Bool {
        guard let (_, _, _) = nearestIntersection(ray, scene: scene) else {
            return false
        }
        
        return true
    }
    
    private func illuminatedColorForPoint(point: Point, normal: Vector, object: Traceable, scene: Scene) -> Color {
        let cr = object.material.color
        let ca = scene.ambientLight
        
        let n = normal
        let p: Double
        let cp: Color
        if case let .Diffuse(_, specularHighlight, phong) = object.material {
            p = phong
            cp = specularHighlight
        }
        else {
            p = 0
            cp = Color(0, 0, 0)
        }
        
        let ambientTerm = cr * ca
        let otherTerms = scene.lightSources.reduce(Color.Zero) { sum, light in
            let rayDirection = light.direction
            let shadowRay = Ray(type: .Shadow, origin: point + (rayDirection / 100000000), direction: rayDirection)
            if isShadowed(shadowRay, scene: scene, lightSource: light) {
                return sum
            }
            else {
                let l = light.direction
                let lambertianTerm = object.material.color * max(0, n ∘ l)
                let ri = 2 * n * (n ∘ l) - l
                let e = scene.lookFrom.normalized()
                let specularTerm = cp * pow(max(0, e ∘ ri), p)
                let color = light.color * (lambertianTerm + specularTerm)
                return sum + color
            }
        }
        return ambientTerm + otherTerms
    }
}