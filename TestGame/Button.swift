//
//  Button.swift
//  TestGame
//
//  Created by Juan on 26/4/18.
//  Copyright © 2018 ThePerkinrex. All rights reserved.
//

import SpriteKit
import GameplayKit

class Button: SKSpriteNode{
    public var hover = false
    public var press = false
    
    final let trackingAreaOptions = [NSTrackingArea.Options.mouseEnteredAndExited, NSTrackingArea.Options.activeInActiveApp] as NSTrackingArea.Options
    
    override init(texture: SKTexture?, color: NSColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        load()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        load()
    }
    
    func load(){
        self.isUserInteractionEnabled = true
    }
    
    func getHoverTrackingArea() -> NSTrackingArea {
        let origin = self.scene?.view?.convert(self.frame.origin, from: self.scene!)
        let area = CGRect(origin: origin!, size: self.size)
        return NSTrackingArea(rect:area,options:self.trackingAreaOptions,owner:self,userInfo:nil)
    }
    
    override func mouseDown(with event: NSEvent) {
        self.press = true
    }
    
    override func mouseUp(with event: NSEvent) {
        self.press = false
    }
    
    override func mouseEntered(with event: NSEvent) {
        self.hover = true;
    }
    
    override func mouseExited(with event: NSEvent) {
        self.hover = false
    }
    
}
