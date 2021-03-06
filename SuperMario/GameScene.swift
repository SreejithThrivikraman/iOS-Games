//
//  GameScene.swift
//  SuperMario
//
//  Created by MacStudent on 2019-02-05.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    
    var coinTimer: Timer?
    var bombTimer: Timer?
    var mario: SKSpriteNode?
    var scoreLabel: SKLabelNode?
    var message: SKLabelNode?
    var score = 0
    
    // For Collision
    let marioCategory: UInt32 = 0x1 << 1
    let coinCategory: UInt32 = 0x1 << 2
    
    let bulletCategory: UInt32 = 0x1 << 5
    
    
    override func didMove(to view: SKView) {
        
        physicsWorld.contactDelegate = self
        
        scoreLabel = childNode(withName: "scoreLabel") as? SKLabelNode
        message = childNode(withName: "message") as? SKLabelNode
        mario = childNode(withName: "mario") as? SKSpriteNode
        
        
        
        
        //collision and contact logic.
        
        mario?.physicsBody?.categoryBitMask = marioCategory
        mario?.physicsBody?.contactTestBitMask = coinCategory
        mario?.physicsBody?.contactTestBitMask = bulletCategory
        
//        mario?.physicsBody?.categoryBitMask = 1
//        mario?.physicsBody?.contactTestBitMask = coinCategory
//        mario?.physicsBody?.collisionBitMask = 8
        
        var mario_run: [SKTexture] = []
        for number in 1...5
        {
            mario_run.append(SKTexture(imageNamed: "frame-\(number).png"))
        }
        
       
        
        
        mario?.run(SKAction.repeatForever(SKAction.animate(with: mario_run, timePerFrame: 0.2)))
        
        coinTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(timer) in self.createCoin()})
        bombTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: {(timer) in self.createBomb()})
        
        
        
       
    }
    
    
  
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
    
        mario?.physicsBody?.applyForce(CGVector(dx:0, dy:50000))
     }
    
    func createCoin()
    {
       let coin = SKSpriteNode(imageNamed: "coin_image")
       coin.size = CGSize(width: 100, height: 100)
        
       let xx = size.width/2 - coin.size.width
        
       let maxY = size.height / 2 - coin.size.height / 2
       let minY = -size.height / 2 + coin.size.height / 2
       let range = maxY - minY
       let coinY = maxY - CGFloat(arc4random_uniform(UInt32(range)))
       
        coin.position = CGPoint(x: xx , y: coinY)
        coin.physicsBody = SKPhysicsBody(rectangleOf: coin.size)
        coin.physicsBody?.affectedByGravity = false
        
        //For collision
        coin.physicsBody?.categoryBitMask = coinCategory
        coin.physicsBody?.collisionBitMask = 0
        coin.physicsBody?.contactTestBitMask = marioCategory
       
      
        
        addChild(coin)
        
        let moveLeft = SKAction.moveBy(x: -size.width, y: 0, duration: 4)
        let sequence = SKAction.sequence([moveLeft, SKAction.removeFromParent()])
        coin.run(sequence)

    }
    
    
    func createBomb()
    {
        let bomb = SKSpriteNode(imageNamed: "Bird1")
        
        
        bomb.size = CGSize(width: 100, height: 100)
        
        let xx = size.width/2 - bomb.size.width
        
        let maxY = size.height / 2 - bomb.size.height / 2
        let minY = -size.height / 2 + bomb.size.height / 2
        let range = maxY - minY
        let coinY = maxY - CGFloat(arc4random_uniform(UInt32(range)))
        
        bomb.position = CGPoint(x: xx , y: coinY)
        bomb.physicsBody = SKPhysicsBody(rectangleOf: bomb.size)
        bomb.physicsBody?.affectedByGravity = false
        
        //For collision
        bomb.physicsBody?.categoryBitMask = bulletCategory
        bomb.physicsBody?.collisionBitMask = 0
        bomb.physicsBody?.contactTestBitMask = marioCategory
        
        
        
        addChild(bomb)
        
        let moveLeft = SKAction.moveBy(x: -size.width, y: 0, duration: 4)
        let sequence = SKAction.sequence([moveLeft, SKAction.removeFromParent()])
        bomb.run(sequence)
        
        var bomb_run: [SKTexture] = []
        for bomb_number in 1...2
        {
            bomb_run.append(SKTexture(imageNamed: "Bird\(bomb_number).png"))
        }
        
        bomb.run(SKAction.repeatForever(SKAction.animate(with: bomb_run, timePerFrame: 0.2)))
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        print("Contact!!!")
        
        if contact.bodyA.categoryBitMask == coinCategory {
            contact.bodyA.node?.removeFromParent()
            score += 1
            scoreLabel?.text = "Score: \(score)"

        }
        if contact.bodyB.categoryBitMask == coinCategory
        {
            contact.bodyB.node?.removeFromParent()
            score += 1
            scoreLabel?.text = "Score: \(score)"

        }

        
        if contact.bodyB.categoryBitMask == bulletCategory
            {
                message?.text = "Game Over !!"
                coinTimer?.invalidate()
                bombTimer?.invalidate()
                
                mario?.removeFromParent()
               

            }
        
       
        
    }
    
   
}
