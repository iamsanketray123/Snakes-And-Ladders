//
//  Snake.swift
//  SnakesAndLadders
//
//  Created by Sanket  Ray on 08/09/22.
//

import Foundation

final class Snake {
    
    
    // MARK: - Variables
    private var start: Int
    public private(set) var end: Int
    
    
    // MARK: - Initialisation Methods
    init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

