//
//  GameManager.swift
//  TicTokToe
//
//  Created by Jason Chen on 7/4/19.
//  Copyright © 2019 Jason Chen. All rights reserved.
//

import Foundation

class GameMananger {
    func generateNewGame() -> Game {
        return Game()
    }
    init() {}
}

struct Game {
    var board: Array<String?>
    var isWin: Bool {
        // Better option: Bit manipulation
        // Int16 b = 0x00
        // b & 0000000000000111 == 1
        // Mask concept
        return
            (board[0] == board[1] && board[0] == board[2] && board[0] != "E") || // row 0
                (self.board[3] == self.board[4] && self.board[3] == self.board[5] && self.board[3] != "E") || // row 1
                (self.board[6] == self.board[7] && self.board[6] == self.board[8] && self.board[6] != "E") || // row 2
                (self.board[0] == self.board[3] && self.board[0] == self.board[6] && self.board[0] != "E") || // col 0
                (self.board[1] == self.board[4] && self.board[1] == self.board[7] && self.board[1] != "E") || // col 1
                (self.board[2] == self.board[5] && self.board[2] == self.board[8] && self.board[2] != "E") || // col 2
                (self.board[0] == self.board[4] && self.board[0] == self.board[8] && self.board[0] != "E") || // diag 0
                (self.board[2] == self.board[4] && self.board[2] == self.board[6] && self.board[2] != "E")    // diag 1
    }
    
    /*
 
    private var _turn: Bool = false // false - "X", true - "O"
    var turn: Bool {
        set {
            _turn = newValue
        }
        get {
            return _turn
        }
    }
    */
    var isFull: Bool {
        get {
            return !board.contains("E")
        }
    }
    
    var isDraw: Bool {
        get {
            // Optimization: early termination
            return (!isWin && isFull)
        }
    }
    
    mutating func move(row: Int, col: Int, turn: String = "X") {
        guard row < 3 && col < 3 && col >= 0 && row >= 0 else {
            print("invalid space")
            return
        }
        guard self.board[3 * row + col] != "E" else {
            print(row,",",col," is occupied")
            return
        }
        
        self.board[3 * row + col] = turn
        print (row, ",", col, " is now ", turn)
        
        if isWin {
            print ("Game over," + turn + " wins.")
        } else if isDraw {
            print ("Game over, draw")
        }
    }
    
    init() {
        board = Array<String>()
        for _ in 0...8 {
            board.append("E")
        }
        
    }
}
