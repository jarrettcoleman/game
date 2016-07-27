//
//  GameScene.swift
//  Hack-o-tron
//
//  Created by iD Student on 7/27/16.
//  Copyright (c) 2016 iD Tech. All rights reserved.
//

import SpriteKit
struct BodyType {
    
    static let None: UInt32 = 0
    static let Number: UInt32 = 1
    static let Operation: UInt32 = 2
}
class GameScene: SKScene, SKPhysicsContactDelegate {
    let multiply = Operator(type: "*")
    let add = Operator(type: "+")
    let subtract = Operator(type: "-")
    let divide = Operator(type: "/")
    let num1 = Number(num: 1)
    let num2 = Number(num: 2)
    let num3 = Number(num: 3)
    let num4 = Number(num: 4)
    var stored:Int = 0
    var selected:SKNode = Number(num: 0)
    override func didMoveToView(view: SKView) {
        
        add.position = CGPoint(x: size.width/5, y: size.height-50)
        subtract.position = CGPoint(x: size.width/5*2, y: size.height-50)
        multiply.position = CGPoint(x: size.width/5*3, y: size.height-50)
        divide.position = CGPoint(x: size.width/5*4, y: size.height-50)
        
        divide.size.width = 50
        addChild(add)
        addChild(subtract)
        addChild(multiply)
        addChild(divide)
        
        num1.position = CGPoint(x: size.width/5, y: 50)
        num2.position = CGPoint(x: size.width/5*2, y: 50)
        num3.position = CGPoint(x: size.width/5*3, y: 50)
        num4.position = CGPoint(x: size.width/5*4, y: 50)
        addChild(num1)
        addChild(num2)
        addChild(num3)
        addChild(num4)
        physicsWorld.gravity = CGVectorMake(0,0)
        physicsWorld.contactDelegate = self
        
    }
    func operate(operatorObject:Operator, num: Number) {
        
        
        
        num.removeFromParent()
        if(stored == 0){
            stored = Int(num.name!)!
        }
        else{
           let operatedNum = Number(num: Int(String(stored) + "\(operatorObject.numLabel.text)" + num.name!)!)
            operatedNum.size.height = 50
            operatedNum.size.width = 50
            operatedNum.position = CGPoint(x: size.width/5*4, y: 50)
            addChild(operatedNum)
        }
    }
    
    
    
    func didBeginContact(contact: SKPhysicsContact){
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        let contactA = bodyA.categoryBitMask
        let contactB = bodyB.categoryBitMask
        print("CONTACT???")

        
        switch contactA {
            
        case BodyType.Number:
            
            switch contactB {
                
            case BodyType.Number:
                print("nuM")
                break
                
            case BodyType.Operation:
                if let bodyBNode = contact.bodyB.node as? Operator, bodyANode = contact.bodyA.node as? Number {
                    operate(bodyBNode, num: bodyANode)
                } else {
                    print("\n\n\nADKLSFJASJILDJALS\n\n\n")
                }
                
            
                
            default:
                break
            }
            
        case BodyType.Operation:
            
            switch contactB {
                
            case BodyType.Number:
                if let bodyANode = contact.bodyA.node as? Operator, bodyBNode = contact.bodyB.node as? Number {
                    operate(bodyANode, num: bodyBNode)
                }
                
            case BodyType.Operation:
                break
                
            
                
            default:
                break
            }
            
        default:
            break
        }
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let point = touch?.locationInNode(self)
        if(self.nodeAtPoint(point!).isKindOfClass(Number)){
            selected = self.nodeAtPoint(point!)
        }
        
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        let touch = touches.first
        let point = touch?.locationInNode(self)
        selected.position = point!
    }
    
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    

}
