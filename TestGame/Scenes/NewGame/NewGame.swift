//
//  NewGameScene.swift
//  TestGame
//
//  Created by Juan on 28/4/18.
//  Copyright © 2018 ThePerkinrex. All rights reserved.
//

import SpriteKit
import GameplayKit

class NewGameScene: PScene {
    override func didMove(to view: SKView) {
        loadButtons(inScene: ["NameTextBox"])
    }
}
