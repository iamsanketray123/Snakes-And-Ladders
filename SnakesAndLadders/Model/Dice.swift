//
//  Dice.swift
//  SnakesAndLadders
//
//  Created by Sanket  Ray on 08/09/22.
//

import Foundation

final class Dice {
    
    
    // MARK: - Variables
    private var numberOfSides: Int
    
    
    // MARK: - Initialisation Methods
    init(_ numberOfSides: Int) {
        self.numberOfSides = numberOfSides
    }
    
    
    // MARK: - Helper Methods
    public func roll() -> Int {
        return Int.random(in: 1...numberOfSides)
    }
}
