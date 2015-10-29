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
//        let imageSize = NSSize(width: 5, height: 5)
        let rayTracer = RayTracer()
        let image = rayTracer.trace(imageSize, scene: scene1())
        imageView.image = image
    }

    func scene1() -> Scene {
        var scene = Scene()
        scene.lookFrom = Point(0, 0, 10)
        scene.backgroundColor = .lightGrayColor()
        let sphere1 = Sphere(center: Point(-2, 0, 0), radius: 2, color: .greenColor())
        let sphere2 = Sphere(center: Point(2, 0, 0), radius: 2, color: .greenColor())
        scene.objects = [sphere1, sphere2]
        return scene
    }
}

