//
//  ViewController.swift
//  TicTacToe
//
//  Created by newuser on 2019-02-04.
//  Copyright © 2019 Ferdin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var turn = 1
    var board = [0,0,0,0,0,0,0,0,0]
    
    var winning_conditions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    var gameOver = false
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winnerLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handleClick(_ sender: AnyObject) {
        
        if(board[sender.tag] == 0 && !gameOver){
        if(turn == 1){
            
            sender.setImage(UIImage(named : "cross.png"), for: [])
            
            board[sender.tag] = 1
            turn = 2
            
        }
        else if(turn == 2){
            
            sender.setImage(UIImage(named : "nought.png"), for: [])
            board[sender.tag] = 2;
            turn = 1
            
        }
        }
        
        for iterator in winning_conditions{
            
            if board[iterator[0]] != 0 && board[iterator[0]] == board[iterator[1]] && board[iterator[1]] == board[iterator[2]]{
                
                gameOver = true
                print("The winner is :\( board[iterator[0]])")
                
                if board[iterator[0]] == 1{
                    winnerLabel.text = "The winner is X"
                   // sender.userInteractionEnabled = false
                    !sender.isEnabled
                }
                else if board[iterator[0]] == 2{
                    winnerLabel.text = "The winner is O"
                   // sender.isUserInteractionEnabled = false
                    !sender.isEnabled
                }

                 
            }
            
        }
        print(board)
    }
    
}

