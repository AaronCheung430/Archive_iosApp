//
//  Scene.swift
//  AR Try
//
//  Created by Aaron Cheung 430 on 26/12/2018.
//  Copyright © 2018 Aaron Cheung 430. All rights reserved.
//

import SpriteKit
import ARKit

class Scene: SKScene {
    
    override func didMove(to view: SKView) {
        // Setup your scene here
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        
        // Check if the user touches a label node
        if let touchLocation = touches.first?.location(in: self) {
            if let node = nodes(at: touchLocation).first as? SKLabelNode {
                
                let fadeOut = SKAction.fadeOut(withDuration: 1.0)
                
                node.run(fadeOut) {
                    node.removeFromParent()
                }
                return
            }
        }
        
        // Create anchor using the camera's current position
        if let currentFrame = sceneView.session.currentFrame {
            
            // Create a transform with a translation of 0.2 meters in front of the camera
            var translation = matrix_identity_float4x4
            translation.columns.3.z = -0.4
            let transform = simd_mul(currentFrame.camera.transform, translation)
            
            // Add a new anchor to the session
            let anchor = ARAnchor(transform: transform)
            sceneView.session.add(anchor: anchor)
        }
    }
}
