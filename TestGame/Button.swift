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
    
    private var hoverColor : NSColor?
    private var pressColor : NSColor?
    private var normlColor : NSColor?
    
    private var clickFunc : (() -> Void)?
    
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
        self.normlColor = self.color
        
        // Get the colors
        if let hoverColorString = userData?.value(forKey: "hoverColor") as? String{
            self.hoverColor = getColorFrom(string: hoverColorString)
        }else{
            hoverColor = color.copy() as? NSColor
        }
        
        if let pressColorString = userData?.value(forKey: "pressColor") as? String{
            self.pressColor = getColorFrom(string: pressColorString)
        }else{
            pressColor = color.copy() as? NSColor
        }
        
    }
    
    func setClickFunction(as callFunc : @escaping () -> Void){
        self.clickFunc = callFunc
    }
    
    func setHoverTrackingArea() {
        let origin = self.scene?.view?.convert(self.frame.origin, from: self.scene!)
        let area = CGRect(origin: origin!, size: self.size)
        self.scene?.view?.addTrackingArea(NSTrackingArea(rect:area,options:self.trackingAreaOptions,owner:self,userInfo:nil))
    }
    
    override func mouseDown(with event: NSEvent) {
        self.press = true
        self.color = self.pressColor!;
    }
    
    override func mouseUp(with event: NSEvent) {
        self.press = false
        if hover {
            self.color = self.hoverColor!;
        }else{
            self.color = self.normlColor!;
        }
        if let clickFunc = self.clickFunc {
            clickFunc()
        }
    }
    
    override func mouseEntered(with event: NSEvent) {
        self.hover = true;
        self.color = self.hoverColor!;
    }
    
    override func mouseExited(with event: NSEvent) {
        self.hover = false
        if press {
            self.color = self.pressColor!;
        }else{
            self.color = self.normlColor!;
        }
    }
    
    func getColorFrom(string val : String) -> NSColor{
        let colorList = val.split(separator: ",")
        
        let r = NSColor(red: CGFloat((colorList[0] as NSString).floatValue / 255), green: CGFloat((colorList[1] as NSString).floatValue / 255), blue: CGFloat((colorList[2] as NSString).floatValue / 255), alpha: CGFloat((colorList[3] as NSString).floatValue))
        return r
    }
    
}
