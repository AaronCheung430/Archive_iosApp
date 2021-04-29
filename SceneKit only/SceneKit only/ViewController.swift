//
//  ViewController.swift
//  SceneKit only
//
//  Created by Aaron Cheung 430 on 4/3/2019.
//  Copyright © 2019 Aaron Cheung 430. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let scene = SCNScene(named: "art.scnassets/car.dae")!
        let scene1 = SCNScene(named: "art.scnassets/robot.dae")!
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 5)
        scene.rootNode.addChildNode(cameraNode)
        
//        let lightNode = SCNNode()
//        lightNode.light = SCNLight()
//        lightNode.light?.type = .omni
//        lightNode.position = SCNVector3(0, 10, 2)
        
//        let car = SCNScene(named: "car.dae")
//        scene.rootNode.addChildNode(car)
        
        let stars = SCNParticleSystem(named: "SceneKit Particle System.scnp", inDirectory: nil)!
        scene.rootNode.addParticleSystem(stars)
        
        let sceneView = self.view as! SCNView
        sceneView.scene = scene1
        sceneView.scene = scene
        
        sceneView.showsStatistics = true
        sceneView.backgroundColor = UIColor.blue
        sceneView.allowsCameraControl = true
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

}

