//
//  ViewController.swift
//  SnakesAndLadders
//
//  Created by Sanket  Ray on 08/09/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create Board
        let board = createBoard()
        
        // Start Game
        board.startGame()
    }
    
    
    // MARK: - Helper Methods
    private func createBoard() -> Board {
        
        // Set Board Size
        let boardSize = 10
        
        // Create Players
        let player1 = Player("Sanket")
        let player2 = Player("Sheetal")
        let player3 = Player("Jayu")
        let player4 = Player("Subhi")
        let player5 = Player("Jaago")
        
        // Create Player Queue & Add Players To Queue
        var queue = Queue<Player>()
        queue.enqueue(player1)
        queue.enqueue(player2)
        queue.enqueue(player3)
        queue.enqueue(player4)
        queue.enqueue(player5)
        
        // Create Snakes
        let snake1 = Snake(69, 45)
        let snake2 = Snake(90, 72)
        let snake3 = Snake(30, 4)
        let snakes = [69: snake1, 90: snake2, 30: snake3]
        
        // Create Ladders
        let ladder1 = Ladder(5, 25)
        let ladder2 = Ladder(58, 96)
        let ladder3 = Ladder(40, 51)
        let ladders = [5: ladder1, 58: ladder2, 40: ladder3]
        
        // Create Dice
        let dice = Dice(6)
        
        // Return Board
        return Board(boardSize, queue, snakes, ladders, dice)
    }
}

