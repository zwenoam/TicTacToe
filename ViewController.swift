//
//  ViewController.swift
//  TicTokToe
//
//  Created by Jason Chen on 7/4/19.
//  Copyright © 2019 Jason Chen. All rights reserved.
//

import UIKit
import Foundation

/// My first view controller
class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    @IBOutlet weak var Button0: UIButton!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    
    @IBOutlet weak var Button4: UIButton!
    
    @IBOutlet weak var Button5: UIButton!
    @IBOutlet weak var Button6: UIButton!
    @IBOutlet weak var Button7: UIButton!
    @IBOutlet weak var Button8: UIButton!
    @IBOutlet weak var undo: UIButton!
    @IBOutlet weak var Time: UILabel!
    // Programmily create UI example:
    // var MySecondLabel: UILabel = UILabel(frame: CGRect(x: 1, y: 1, width: 1, height: 1))
    
    var gameManager: GameMananger = GameMananger()
    var game: Game?
    var undoCount: Int = 0
    var boardSequence: Array<Int> = []
    var buttonSequence: Array<UIButton> = []
    var timer = Timer()
    var timerCount: Int = 5
    // MARK: - View lifecycle methods:
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Programmily create UI example:
        // MySecondLabel.text = "Hello Second World"
        // MySecondLabel.textAlignment = NSTextAlignment.left
        // self.view.addSubview(MySecondLabel)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func countDown(on: Bool) {
        resetTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] (_) in
            guard let strongSelf = self else {return}
            strongSelf.timerCount -= 1
            let string = "Time Remaining: " + String(strongSelf.timerCount)
            strongSelf.Time.text = string
            if strongSelf.timerCount == 0 {
                if (strongSelf.myLabel.text == "Player 1's turn") {
                    strongSelf.myLabel.text = "Player 2 wins"
                }else if (strongSelf.myLabel.text == "Player 2's turn") {
                    strongSelf.myLabel.text = "Player 1 wins"
                }
                self?.timer.invalidate()
            }
        })
        
    }
    
    func resetTimer() {
        timer.invalidate()
        timerCount = 5
        Time.text = "Time Remaining: 5"
    }
    
    func startNewGame() -> Void {
        print("start new game")
        game = gameManager.generateNewGame()
        // update ui
        Button0.setTitle(nil, for: .normal)
        Button1.setTitle(nil, for: .normal)
        Button2.setTitle(nil, for: .normal)
        Button3.setTitle(nil, for: .normal)
        Button4.setTitle(nil, for: .normal)
        Button5.setTitle(nil, for: .normal)
        Button6.setTitle(nil, for: .normal)
        Button7.setTitle(nil, for: .normal)
        Button8.setTitle(nil, for: .normal)
        undoCount = 0
        boardSequence.removeAll()
        buttonSequence.removeAll()
    }
    
    func changeTurn() -> Void {
        if (myLabel.text == "Player 1's turn") {
            myLabel.text = "Player 2's turn"
            countDown(on: true)
        }else if (myLabel.text == "Player 2's turn") {
            myLabel.text = "Player 1's turn"
            countDown(on: true)
        }
        
    }
    
    func winOrDraw() -> Void {
        if game?.isWin == true {
            resetTimer()
            if (myLabel.text == "Player 1's turn"){
                myLabel.text = "Player 1 Wins"
            }else if (myLabel.text == " Player 2's turn") {
                myLabel.text = "Player 2 Wins"
            }
        }else if game?.isDraw == true {
            resetTimer()
            myLabel.text = "Draw"
        }
        
    }
    
    
    @IBAction func buttonOnClick(_ sender: Any) {
        myButton.setTitle ("RESTART", for:.normal)
        myLabel.text = "Player 1's turn"
        startNewGame()
        countDown(on: true)
    }
    
    
    @IBAction func button0OnClick(_ sender: Any) {
        guard game?.board[0] == "E" else {
            return
        }
        if (myLabel.text == "Player 1's turn") {
            Button0.setTitle("X", for: .normal)
            game?.board[0] = "X"
        }else if (myLabel.text == "Player 2's turn") {
            Button0.setTitle("O", for:.normal)
            game?.board[0] = "O"
        }
        boardSequence.append(0)
        buttonSequence.append(Button0)
        winOrDraw()
        changeTurn()
    }
    
    @IBAction func button1OnClick(_ sender: Any) {
        guard game?.board[1] == "E" else {
            return
        }
        if (myLabel.text == "Player 1's turn") {
            Button1.setTitle("X", for: .normal)
            game?.board[1] = "X"
        }else if (myLabel.text == "Player 2's turn") {
            Button1.setTitle("O", for:.normal)
            game?.board[1] = "O"
        }
        boardSequence.append(1)
        buttonSequence.append(Button1)
        winOrDraw()
        changeTurn()
    }
    
    
    @IBAction func button2OnClick(_ sender: Any) {
        guard game?.board[2] == "E" else {
            return
        }
        if (myLabel.text == "Player 1's turn") {
            Button2.setTitle("X", for: .normal)
            game?.board[2] = "X"
        }else if (myLabel.text == "Player 2's turn") {
            Button2.setTitle("O", for:.normal)
            game?.board[2] = "O"
        }
        boardSequence.append(2)
        buttonSequence.append(Button2)
        winOrDraw()
        changeTurn()
    }
    
    @IBAction func button3OnClick(_ sender: Any) {
        guard game?.board[3] == "E" else {
            return
        }
        if (myLabel.text == "Player 1's turn") {
            Button3.setTitle("X", for: .normal)
            game?.board[3] = "X"
        }else if (myLabel.text == "Player 2's turn") {
            Button3.setTitle("O", for:.normal)
            game?.board[3] = "O"
        }
        boardSequence.append(3)
        buttonSequence.append(Button3)
        winOrDraw()
        changeTurn()
    }
    @IBAction func button4OnClick(_ sender: Any) {
        guard game?.board[4] == "E" else {
            return
        }
        if (myLabel.text == "Player 1's turn") {
            Button4.setTitle("X", for: .normal)
            game?.board[4] = "X"
        }else if (myLabel.text == "Player 2's turn") {
            Button4.setTitle("O", for:.normal)
            game?.board[4] = "O"
        }
        boardSequence.append(4)
        buttonSequence.append(Button4)
        winOrDraw()
        changeTurn()
    }
    @IBAction func button5OnClick(_ sender: Any) {
        guard game?.board[5] == "E" else {
            return
        }
        if (myLabel.text == "Player 1's turn") {
            Button5.setTitle("X", for: .normal)
            game?.board[5] = "X"
        }else if (myLabel.text == "Player 2's turn") {
            Button5.setTitle("O", for:.normal)
            game?.board[5] = "O"
        }
        boardSequence.append(5)
        buttonSequence.append(Button5)
        winOrDraw()
        changeTurn()
    }
    
    @IBAction func button6OnClick(_ sender: Any) {
        guard game?.board[6] == "E" else {
            return
        }
        if (myLabel.text == "Player 1's turn") {
            Button6.setTitle("X", for: .normal)
            game?.board[6] = "X"
        }else if (myLabel.text == "Player 2's turn") {
            Button6.setTitle("O", for:.normal)
            game?.board[6] = "O"
        }
        boardSequence.append(6)
        buttonSequence.append(Button6)
        winOrDraw()
        changeTurn()
    }
    
    @IBAction func button7OnClick(_ sender: Any) {
        guard game?.board[7] == "E" else {
            return
        }
        if (myLabel.text == "Player 1's turn") {
            Button7.setTitle("X", for: .normal)
            game?.board[7] = "X"
        }else if (myLabel.text == "Player 2's turn") {
            Button7.setTitle("O", for:.normal)
            game?.board[7] = "O"
        }
        boardSequence.append(7)
        buttonSequence.append(Button7)
        winOrDraw()
        changeTurn()
    }
    
    @IBAction func button8OnClick(_ sender: Any) {
        guard game?.board[8] == "E" else {
            return
        }
        if (myLabel.text == "Player 1's turn") {
            Button8.setTitle("X", for: .normal)
            game?.board[8] = "X"
        }else if (myLabel.text == "Player 2's turn") {
            Button8.setTitle("O", for:.normal)
            game?.board[8] = "O"
        }
        boardSequence.append(8)
        buttonSequence.append(Button8)
        winOrDraw()
        changeTurn()
    }
    @IBAction func undoOnClick(_ sender: Any) {
        guard undoCount < 2 else {
            return
        }
        undoCount += 1
        changeTurn()
        let lastTurn: UIButton? = buttonSequence.last
        let lastGrid: Int? = boardSequence.last
        game?.board[lastGrid ?? -1] = "E"
        lastTurn?.setTitle(nil, for: .normal)
        
    }
}

