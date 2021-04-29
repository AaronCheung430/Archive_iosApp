//
//  ViewController.swift
//  AR with Japanese 3D Model
//
//  Created by Aaron Cheung 430 on 16/1/2019.
//  Copyright © 2019 Aaron Cheung 430. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet var sceneView: ARSCNView!
    
    private var planes: [ UUID: PlaneNode ] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        sceneView.delegate = self
        sceneView.debugOptions = [ ARSCNDebugOptions.showFeaturePoints ]
        
        
        let tapGestureRecongnizer = UITapGestureRecognizer(target: self, action: #selector(addRobot(recognizer:)))
        sceneView.addGestureRecognizer(tapGestureRecongnizer)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session congifuration
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = .horizontal
        
        // Run the view's session
        sceneView.session.run(configuration)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    @objc func addRobot(recognizer: UITapGestureRecognizer){
        let tapLocation = recognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
        
        guard let hitResult = hitResults.first else {
            return
        }
        
        guard let scene = SCNScene(named: "art.scnassets/SambaDancing.scn") else{
            return
        }
        
        let node = SCNNode()
        for childNode in scene.rootNode.childNodes {
            node.addChildNode(childNode)
        }
        
        node.position = SCNVector3(hitResult.worldTransform.columns.3.x, hitResult.worldTransform.columns.3.y, hitResult.worldTransform.columns.3.z)
        node.scale = SCNVector3(0.001, 0.001, 0.001)
        //node.rotation = SCNVector4(0, 1, 0, Float.pi)
        
        sceneView.scene.rootNode.addChildNode(node)
    }

}

extension ViewController: ARSCNViewDelegate{
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor){
        
        print("Surface deteced!")
        
        if let planeAnchor = anchor as? ARPlaneAnchor {
            
            let planeNode = PlaneNode(anchor: planeAnchor)
            
//            // Create a virtual plane to visualize the detected plane
//            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
//
//            // Set the colour of the virtual plane
//            plane.materials.first?.diffuse.contents = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 0.50)
//
//            // Create the SceneKit plane node
//            let planeNode = SCNNode(geometry: plane)
//            planeNode.position = SCNVector3(planeAnchor.center.x, 0.0, planeAnchor.center.z)
//
//            // Since the plane in SceneKit is vertical, we have to rotate it by 90 degrees
//            // The value should be in the form of radian.
//            planeNode.eulerAngles.x = -Float.pi / 2.0
            
            planes[anchor.identifier] = planeNode
            //node.addChildNode(planeNode)
        }
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor, let plane = planes[planeAnchor.identifier] else {
            return
        }
        plane.update(anchor: planeAnchor)
    }
    
}

