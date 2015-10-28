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

        let imageSize = view.bounds.size
        let rayTracer = RayTracer()
        let image = rayTracer.trace(imageSize, scene: scene1())
        imageView.image = image
    }

    func scene1() -> Scene {
        var scene = Scene()
        scene.lookFrom = Point(0, 0, 10)
        return scene
    }
}

