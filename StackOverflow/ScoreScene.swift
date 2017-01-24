//
//  ScoreScene.swift
//  StackOverflow
//
//  Created by Sumner on 1/21/17.
//  Copyright © 2017 Sumner. All rights reserved.
//

import Foundation
import SpriteKit

class ScoreScene: SKScene {
    
    
    let scoreLabel = SKLabelNode()
    let menuLabel = SKLabelNode()
    
    init(size: CGSize, score: Double) {
        
        super.init(size: size)

        backgroundColor = SKColor.white
        
        
        scoreLabel.text = "It took you \(score) seconds"
        scoreLabel.fontColor = SKColor.black
        scoreLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        menuLabel.text = "menu"
        menuLabel.fontColor = SKColor.black
        menuLabel.position = CGPoint(x: size.width / 2, y: size.height / 4 * 1)
        
        addChild(scoreLabel)
        addChild(menuLabel)
        
       
        
    }
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if menuLabel.contains(touchLocation) {
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.5)
            let menuScene = MenuScene(size: self.size)
            self.view?.presentScene(menuScene, transition: reveal)

        }

    }
}
