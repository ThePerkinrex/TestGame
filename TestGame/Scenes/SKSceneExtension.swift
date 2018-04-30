//
//  SKSceneExtension.swift
//  TestGame
//
//  Created by Juan on 30/4/18.
//  Copyright © 2018 ThePerkinrex. All rights reserved.
//

import SpriteKit

class PScene : SKScene {
    private var updateFunctions = [((TimeInterval) -> Void)]()
    private var buttons = [Button]()
    
    func sceneUpdate(_ currentTime: TimeInterval) {}
    
    override func update(_ currentTime : TimeInterval) {
        if updateFunctions.count > 0 {
            for function in updateFunctions {
                function(currentTime)
            }
        } else {
            updateFunctions.append(self.sceneUpdate)
        }
    }
    
    func addUpdateFunction(_ updateFunction : @escaping (TimeInterval) -> Void) {
        if updateFunctions.count > 0 {
            updateFunctions.append(updateFunction)
        } else {
            updateFunctions.append(sceneUpdate)
            updateFunctions.append(updateFunction)
        }
    }
    
    func loadButtons(inScene buttonsInScene : [String]){
        for btnName in buttonsInScene{
            if let btn = self.childNode(withName: btnName) as? Button {
                btn.setHoverTrackingArea()
                buttons.append(btn)
            }
        }
    }
    
    override func willMove(from view: SKView) {
        for trackingArea in view.trackingAreas {
            view.removeTrackingArea(trackingArea)
        }
    }
    
    func sceneKeyDown(with event: NSEvent){}
    
    override func keyDown(with event: NSEvent) {
        sceneKeyDown(with: event)
        for btn in buttons {
            btn.keyDown(with: event)
        }
    }
}
