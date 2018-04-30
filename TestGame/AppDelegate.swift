//
//  AppDelegate.swift
//  TestGame
//
//  Created by Juan on 25/4/18.
//  Copyright © 2018 ThePerkinrex. All rights reserved.
//


import Cocoa
import SpriteKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
}

extension SKScene {
    func changeToScene(fileNamed filename : String){
        changeToScene(SKScene(fileNamed: filename))
    }
    
    func changeToScene(_ scene : SKScene?){
        if let sceneLoaded = scene {
            // Set the scale mode to scale to fit the window
            sceneLoaded.scaleMode = .aspectFill
            
            // Present the scene
            self.view?.presentScene(sceneLoaded)
        }
    }
}
