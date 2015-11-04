//
//  ViewController.swift
//  RayTracer
//
//  Created by Jason Larsen on 10/24/15.
//  Copyright © 2015 Heartbit. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var imageView: NSImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayout() {
        let imageSize = view.bounds.size
        let rayTracer = RayTracer()
        let image = rayTracer.trace(imageSize, scene: scene1())
        imageView.image = image
    }

    func scene1() -> Scene {
        var scene = Scene()
        scene.lookFrom = Point(0, 0, 10)
        scene.backgroundColor = NSColor(calibratedRed: 0.7, green: 0.7, blue: 0.7, alpha: 1)
        let sphere1 = Sphere(center: Point(-2, 0, 0), radius: 2, material: .Diffuse(color: Color(1, 0, 0), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        let sphere2 = Sphere(center: Point(1, 0, -2), radius: 1.5, material: .Diffuse(color: Color(0, 1, 0), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        let sphere3 = Sphere(center: Point(0.5, 2.5, 0), radius: 0.5, material: .Diffuse(color: Color(1, 1, 1), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        let floor = Polygon(points: [Point(-5, -3, 5), Point(-5, -3, -10), Point(5, -3, -10), Point(5, -3, 5)], material: .Diffuse(color: Color(0, 0.25, 1), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        scene.objects = [sphere1, sphere2, sphere3, floor]
        scene.ambientLight = Color(0.3, 0.3, 0.3)
        var lightSource = DirectionalLightSource()
        lightSource.direction = Vector(-0.25, 1, 1).normalized()
        scene.lightSources.append(lightSource)
        return scene
    }
}

