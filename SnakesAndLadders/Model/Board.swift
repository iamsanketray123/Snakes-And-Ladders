//
//  Board.swift
//  SnakesAndLadders
//
//  Created by Sanket  Ray on 08/09/22.
//

import Foundation

final class Board {
    
    
    // MARK: - Variables
    private var grid: [[Int]] = []
    private var playersQueue: Queue<Player> = Queue<Player>()
    private var snakes: [Int: Snake] = [:]
    private var ladders: [Int: Ladder] = [:]
    private var dice: Dice
    
    
    // MARK: - Initialisation Methods
    init(_ size: Int, _ playersQueue: Queue<Player>, _ snakes: [Int: Snake], _ ladders: [Int: Ladder], _ dice: Dice) {
        self.playersQueue = playersQueue
        self.snakes = snakes
        self.ladders = ladders
        self.dice = dice
        self.buildGrid(with: size)
    }
    
    
    // MARK: - Helper Methods
    private func buildGrid(with size: Int) {
        
        // Create Create
        grid = Array(repeating: Array(repeating: 0, count: size), count: size)
        
        // Value of squares in grid --> incremented inside for loop
        var val = 1
        
        // Iterate over rows from the end --> bottom left corner has value 1
        for row in stride(from: size-1, through: 0, by: -1) {
            for col in 0..<size {
                
                // Set Square Value
                grid[row][col] = val
                
                // Increase Val For Next Square
                val += 1
            }
        }
    }
    
    public func startGame() {
        
        // Continue till we have players available in the queue
        while !playersQueue.isEmpty {
            let player = playersQueue.dequeue()! // don't force unwrap in production :P
            
            // Roll Dice To Move On Board
            let diceValue = player.roll(dice)
            
            let currentPosition = player.position
            var newPosition = currentPosition + diceValue
            
            if newPosition > grid.count * grid.count {
                newPosition = currentPosition
            }
            
            // Check If There exists A Snake/ Ladder
            if snakes[newPosition] != nil { // bit by snake --> sad life
                let snake = snakes[newPosition]!
                let snakeEndPosition = snake.end
                
                player.updatePosition(to: snakeEndPosition)
                playersQueue.enqueue(player)
                continue
            }
            
            if ladders[newPosition] != nil { // found ladder --> yayyyyy
                let ladder = ladders[newPosition]!
                let ladderEndPosition = ladder.end
                
                player.updatePosition(to: ladderEndPosition)
                playersQueue.enqueue(player)
                continue
            }
            
            if newPosition == grid.count * grid.count {
                print("\(player.name) has completd the game with \(player.numberOfMoves) number of moves")
            } else {
                
                player.updatePosition(to: newPosition)
                playersQueue.enqueue(player)
            }
        }
    }
}
