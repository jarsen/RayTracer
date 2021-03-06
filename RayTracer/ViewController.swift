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
    
    override func viewDidAppear() {
        super.viewDidAppear()
        view.window?.title = "Ray Tracer"
    }
    
    override func viewDidLayout() {
        let imageSize = view.bounds.size
        let rayTracer = RayTracer()
        let image = rayTracer.trace(imageSize, scene: complexScene())
        imageView.image = image
    }

    func scene1() -> Scene {
        var scene = Scene(lookFrom: Point(0, 0, 10), fieldOfView: 60)
        scene.backgroundColor = Color(0.7, 0.7, 0.7)
        let sphere1 = Sphere(center: Point(-2, 0, 0), radius: 2, material: .Diffuse(color: Color(1, 0, 0), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        let sphere2 = Sphere(center: Point(1, 0, -2), radius: 1.5, material: .Diffuse(color: Color(0, 1, 0), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        let sphere3 = Sphere(center: Point(0.5, 2.5, 0), radius: 0.5, material: .Diffuse(color: Color(1, 1, 1), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        let floor = Polygon(points: [Point(-5, -3, 5), Point(-5, -3, -10), Point(5, -3, -10), Point(5, -3, 5)], material: .Diffuse(color: Color(0, 0.25, 1), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        scene.objects = [sphere1, sphere2, sphere3, floor]
        scene.ambientLight = Color(0.3, 0.3, 0.3)
        let lightSource = DirectionalLightSource(direction: Vector(-0.25, 1, 1), color: Color(1, 1, 1))
        scene.lightSources.append(lightSource)
        return scene
    }
    
    func scene2() -> Scene {
        var scene = Scene(lookFrom: Point(0, 0, 10), fieldOfView: 60)
        scene.backgroundColor = Color(0.7, 0.7, 0.7)
        let sphere1 = Sphere(center: Point(-2, 0, 0), radius: 2, material: .Diffuse(color: Color(1, 0, 0), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        let sphere2 = Sphere(center: Point(1, 0, -2), radius: 1.5, material: .Diffuse(color: Color(0, 1, 0), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        let sphere3 = Sphere(center: Point(0.5, 2.5, 0), radius: 0.5, material: .Reflective(color: Color(1,1,1)))
        let floor = Polygon(points: [Point(-5, -3, 5), Point(-5, -3, -10), Point(5, -3, -10), Point(5, -3, 5)], material: .Diffuse(color: Color(0, 0.25, 1), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        scene.objects = [sphere1, sphere2, sphere3, floor]
        scene.ambientLight = Color(0.3, 0.3, 0.3)
        let lightSource = DirectionalLightSource(direction: Vector(-0.25, 1, 1), color: Color(1, 1, 1))
        scene.lightSources.append(lightSource)
        return scene
    }
    
    func scene3() -> Scene {
        var scene = Scene(lookFrom: Point(0, 0, 10), fieldOfView: 60)
        scene.backgroundColor = Color(0.7, 0.7, 0.7)
        let sphere1 = Sphere(center: Point(-2, 0, 0), radius: 2, material: .Diffuse(color: Color(1, 0, 0), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        let sphere2 = Sphere(center: Point(1, 0, -2), radius: 1.5, material: .Diffuse(color: Color(0, 1, 0), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        let sphere3 = Sphere(center: Point(0.5, 2.5, 0), radius: 0.5, material: .Transparent(color: Color(1,1,1)))
        let floor = Polygon(points: [Point(-5, -3, 5), Point(-5, -3, -10), Point(5, -3, -10), Point(5, -3, 5)], material: .Diffuse(color: Color(0, 0.25, 1), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        scene.objects = [sphere1, sphere2, sphere3, floor]
        scene.ambientLight = Color(0.3, 0.3, 0.3)
        let lightSource = DirectionalLightSource(direction: Vector(-0.25, 1, 1), color: Color(1, 1, 1))
        scene.lightSources.append(lightSource)
        return scene
    }
    
    func complexScene() -> Scene {
        var scene = Scene(lookFrom: Point(0, 0, 10), fieldOfView: 60)
        scene.backgroundColor = Color(0.2, 0.2, 0.2)
        let sphere1 = Sphere(center: Point(-2, 0, 0), radius: 2, material: .Diffuse(color: Color(1, 0, 0), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        let sphere2 = Sphere(center: Point(1, 0, -2), radius: 1.5, material: .Diffuse(color: Color(0, 1, 0), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        let sphere3 = Sphere(center: Point(-1, 3, 1), radius: 0.5, material: .Reflective(color: Color(0.2,0.2,0.2)))
        let floor = Polygon(points: [Point(-5, -3, 5), Point(-5, -3, -10), Point(5, -3, -10), Point(5, -3, 5)], material: .Diffuse(color: Color(0, 0.25, 1), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        let glass = Polygon(points: [Point(-2,-0.5,2), Point(1,2.5,2), Point(1,-1.5,2)], material: .Transparent(color: Color(1,1,1)))
        let leftWall = Polygon(points: [Point(-5, -3, 5), Point(-5, 7, 5), Point(-5, 7, -10), Point(-5, -3, -10)], material: .Diffuse(color: Color(1, 0, 1), specularHighlight: Color(1, 1, 1), phongConstant: 16))
        let backWall = Polygon(points: [Point(-5, -3, -10), Point(-5, 7, -10), Point(5, 7, -10), Point(5, -3, -10)], material: .Diffuse(color: Color(0, 1, 1), specularHighlight: Color(1, 1, 1), phongConstant: 16))

        scene.objects = [sphere1, sphere2, sphere3, floor, glass, leftWall, backWall]
        scene.ambientLight = Color(0.3, 0.3, 0.3)
        let lightSource = DirectionalLightSource(direction: Vector(-0.25, 1, 1), color: Color(1, 1, 1))
        scene.lightSources.append(lightSource)
        return scene

    }
    
    func diffuseScene() -> Scene {
        var scene = Scene(lookFrom: Point(0, 0, 1), fieldOfView: 60)
        scene.ambientLight = Color(0.1, 0.1, 0.1)
        scene.backgroundColor = Color(0.2, 0.2, 0.2)
        
        let lightSource = DirectionalLightSource(direction: Vector(1, 0, 0), color: Color(1, 1, 1))
        scene.lightSources = [lightSource]
        
        let sphere1 = Sphere(center: Point(0.35, 0, -0.1), radius: 0.05, material: .Diffuse(color: Color(1, 1, 1), specularHighlight: Color(1, 1, 1), phongConstant: 4))
        let sphere2 = Sphere(center: Point(0.2, 0, -0.1), radius: 0.075, material: .Diffuse(color: Color(1, 0, 0), specularHighlight: Color(0.5, 1, 0.5), phongConstant: 32))
        let sphere3 = Sphere(center: Point(-0.6, 0, 0), radius: 0.3, material: .Diffuse(color: Color(0, 1, 0), specularHighlight: Color(0.5, 1, 0.5), phongConstant: 32))
        
        let triangle1 = Polygon(points: [Point(0.3, -0.3, -0.4), Point(0, 0.3, -0.1), Point(-0.3, -0.3, 0.2)], material: .Diffuse(color: Color(0, 0, 1), specularHighlight: Color(1, 1, 1), phongConstant: 32))
        let triangle2 = Polygon(points: [Point(-0.2, 0.1, 0.1), Point(-0.2, -0.5, 0.2), Point(-0.2, 0.1, -0.3)], material: .Diffuse(color: Color(1, 1, 0), specularHighlight: Color(1, 1, 1), phongConstant: 4))
        
        scene.objects = [sphere1, sphere2, sphere3, triangle1, triangle2]
        
        return scene
    }
    
    func scenellScene() -> Scene {
        var scene = Scene(lookFrom: Point(0, 0, 1.2), fieldOfView: 100)
        let lightSource = DirectionalLightSource(direction: Vector(0, 1, 0), color: Color(1, 1, 1))
        scene.lightSources.append(lightSource)
        scene.ambientLight = Color(0, 0, 0)
        scene.backgroundColor = Color(0.2, 0.2, 0.2)
        
        let sphere = Sphere(center: Point(0, 0.3, 0), radius: 0.2, material: Material.Reflective(color: Color(0.75, 0.75, 0.75)))
        let triangle1 = Polygon(points: [Point(0, -0.5, 0.5), Point(1, 0.5, 0), Point(0, -0.5, -0.5)], material: Material.Diffuse(color: Color(0, 0, 1), specularHighlight: Color(1, 1, 1), phongConstant: 4))
        let triangle2 = Polygon(points: [Point(0, -0.5, 0.5), Point(0, -0.5, -0.5), Point(-1, 0.5, 0)], material: Material.Diffuse(color: Color(1, 1, 0), specularHighlight: Color(1, 1, 1), phongConstant: 4))
        
        scene.objects = [sphere, triangle1, triangle2]
        
        return scene
    }
}

