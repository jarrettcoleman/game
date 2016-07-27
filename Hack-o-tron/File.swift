//
//  File.swift
//  Hack-o-tron
//
//  Created by iD Student on 7/27/16.
//  Copyright © 2016 iD Tech. All rights reserved.
//

import SpriteKit
import UIKit

class Number: SKSpriteNode{
    let numLabel = SKLabelNode(fontNamed: "Arial")
    init(num: Int){
        let texture = SKTexture(imageNamed: "\(num)")
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.size.height = 50
        self.size.width = 50
        self.name = String(num)
        self.physicsBody?.categoryBitMask = BodyType.Number
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.contactTestBitMask = BodyType.Operation
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.dynamic = false
        self.physicsBody = SKPhysicsBody(rectangleOfSize: self.size)
    }
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    func changeNum(num: Int){
        self.numLabel.text = String(num)
    }
}