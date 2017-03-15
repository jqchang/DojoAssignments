//
//  GameScene.swift
//  joystickDemo
//
//  Created by Justin Chang on 3/10/17.
//  Copyright © 2017 Justin Chang. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        self.anchorPoint = .zero
        let mySprite = SKSpriteNode(color: .blue, size:CGSize(width:50, height:50))
        mySprite.position = CGPoint(x:150, y:150)
        self.addChild(mySprite)
    }
}
