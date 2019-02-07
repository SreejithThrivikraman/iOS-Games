//
//  GameScene.swift
//  Dots
//
//  Created by MacStudent on 2019-02-06.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    var dot : SKSpriteNode?
    var basket :SKSpriteNode?
    var scoreLabel: SKSpriteNode?
    
    
    
    override func didMove(to view: SKView)
    {
        
        physicsWorld.contactDelegate = self as! SKPhysicsContactDelegate
        
        dot = childNode(withName: "doodle-soccer-ball_1034-741" ) as? SKSpriteNode
        basket = childNode(withName: "basket") as? SKSpriteNode
        scoreLabel = childNode(withName: "<#T##String#>") as? SKSpriteNode
        
        
        
        
    }
    
    
  
    
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
   
}
