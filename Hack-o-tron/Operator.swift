//
//  Operator.swift
//  Hack-o-tron
//
//  Created by iD Student on 7/27/16.
//  Copyright © 2016 iD Tech. All rights reserved.
//

import SpriteKit

class Operator: SKSpriteNode{
    let numLabel = SKLabelNode(fontNamed: "Arial")
    init(type: String){
        
            let texture = SKTexture(imageNamed: "circle")
            super.init(texture: texture, color: UIColor(), size: texture.size())
            numLabel.position = CGPointMake(self.size.width/2, self.size.height/2)
            numLabel.fontSize = 12
            numLabel.fontColor = UIColor.blackColor()
            numLabel.text = type
            numLabel.zPosition = 1
            self.size.height = 50
            self.size.width = 50
        self.physicsBody?.categoryBitMask = BodyType.Operation
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.contactTestBitMask = BodyType.Number
        self.physicsBody?.dynamic = false
            self.physicsBody = SKPhysicsBody(rectangleOfSize: self.size)
        self.zPosition = 1
            addChild(numLabel)
        
    }
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}