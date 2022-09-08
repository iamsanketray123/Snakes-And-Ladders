//
//  Player.swift
//  SnakesAndLadders
//
//  Created by Sanket  Ray on 08/09/22.
//

import Foundation

final class Player {
    
    
    // MARK: - Variables
    public private(set) var name: String
    public private(set) var numberOfMoves: Int
    public private(set) var position: Int
    
    
    // MARK: - Initialisation Methods
    init(_ name: String) {
        self.name = name
        self.numberOfMoves = 0
        self.position = 1
    }
    
    public func updatePosition(to position: Int) {
        self.numberOfMoves += 1
        self.position = position
    }
    
    public func roll(_ dice: Dice) -> Int {
        return dice.roll()
    }
}

