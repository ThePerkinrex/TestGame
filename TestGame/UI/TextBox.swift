//
//  TextBox.swift
//  TestGame
//
//  Created by Juan on 28/4/18.
//  Copyright © 2018 ThePerkinrex. All rights reserved.
//

import SpriteKit
import GameplayKit

class TextBox: Button{
    
    private final let presetColor = NSColor.tertiaryLabelColor
    private final let textColor = NSColor.textColor
    
    private var presetText = ""
    private var customText = ""
    private var textLabel : SKLabelNode?
    
    private var selected = false
    
    override init(texture: SKTexture?, color: NSColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        load()
        loadTextBox()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        load()
        loadTextBox()
    }
    
    func loadTextBox(){
        //self.isUserInteractionEnabled = true
        setClickFunction(as: click)
        if let labelNode = childNode(withName: "text") as? SKLabelNode {
            textLabel = labelNode
            presetText = (textLabel?.text)!
        }
    }
    
    override func keyDown(with event: NSEvent) {
        if selected {
            print("Key Pressed: \(event.characters!) TextBOX")
        }
    }
    
    func click(){
        selected = !selected
        print("selected: \(selected)")
    }
}
