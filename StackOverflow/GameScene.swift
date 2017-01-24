//
//  GameScene.swift
//  StackOverflow
//
//  Created by Sumner on 1/17/17.
//  Copyright © 2017 Sumner. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var cam: SKCameraNode!
    
    var sprite = SKSpriteNode(imageNamed: "sprite")
    var sprite2 = SKSpriteNode(imageNamed: "sprite2")
    
    var timeStart: Date!
    
    init(size: CGSize, difficulty: String) {
        super.init(size: size)
        gameDifficulty = difficulty
        timeStart = Date()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        
        print("Game starting with \(gameDifficulty) difficulty")
        
        // Scale Sprites
        sprite.setScale(0.3)
        sprite2.setScale(0.3)
        
        sprite.position = CGPoint(x: size.width/4,y: size.height/2)
        sprite2.position = CGPoint(x: size.width/4 * 3,y: size.height/2)
        
        addChild(sprite)
        addChild(sprite2)
       
        if gameDifficulty == "hard" {
            let sprite3 = SKSpriteNode(imageNamed: "sprite")
            sprite3.setScale(0.3)
            sprite3.position = CGPoint(x: size.width/4 * 2,y: size.height/2)
            addChild(sprite3)
        }
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if sprite.contains(touchLocation) {
            print("You tapped the blue sprite")
        }
        
        if sprite2.contains(touchLocation) {
            print("You tapped the purple sprite")
            
            let now = Date()
            let howLong = now.timeIntervalSinceReferenceDate - timeStart.timeIntervalSinceReferenceDate
            
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.5)
            let scoreScene = ScoreScene(size: self.size, score: howLong)
            self.view?.presentScene(scoreScene, transition: reveal)
        }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
