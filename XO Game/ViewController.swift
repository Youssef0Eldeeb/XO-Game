//
//  ViewController.swift
//  XO Game
//
//  Created by Youssef Eldeeb on 14/02/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetTheGame()
        stackViewContainer.layer.cornerRadius = 30
        stackViewContainer.layer.masksToBounds = true
    }
    
    @IBOutlet weak var stackViewContainer: UIStackView!
    var player: Int = 1
    var gameIsActive = true
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningIndex = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var B0: UIButton!
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var B4: UIButton!
    @IBOutlet weak var B5: UIButton!
    @IBOutlet weak var B6: UIButton!
    @IBOutlet weak var B7: UIButton!
    @IBOutlet weak var B8: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        selectPosition(button: sender)
    }
    
    @IBAction func playAgainBtn(_ sender: Any) {
        resetTheGame()
    }
    
    func resetTheGame(){
        B0.setImage(nil, for: UIControl.State.normal)
        B1.setImage(nil, for: UIControl.State.normal)
        B2.setImage(nil, for: UIControl.State.normal)
        B3.setImage(nil, for: UIControl.State.normal)
        B4.setImage(nil, for: UIControl.State.normal)
        B5.setImage(nil, for: UIControl.State.normal)
        B6.setImage(nil, for: UIControl.State.normal)
        B7.setImage(nil, for: UIControl.State.normal)
        B8.setImage(nil, for: UIControl.State.normal)
        resultLabel.text = ""
        
        for i in 0...8 {
            gameState[i] = 0
        }
        gameIsActive = true
    }
    
    func selectPosition(button: UIButton){
        if gameIsActive{
            if button.image(for: UIControl.State.normal)==nil {
                if player == 1 {
                    button.setImage(UIImage(named: "x3"), for: UIControl.State.normal)
                }else{
                    button.setImage(UIImage(named: "o2"), for: UIControl.State.normal)
                }
                gameState[button.tag] = player
                determinWinner()
                player = player == 1 ? 2 : 1
            }
            print(gameState)
        }
    }
    
    func determinWinner(){
        for subArray in winningIndex{
            if gameState[subArray[0]] != 0 &&
                gameState[subArray[0]] == gameState[subArray[1]] &&
                gameState[subArray[1]] == gameState[subArray[2]]
            {
                print("there is winner")
                resultLabel.text = player==1 ? "Winner is X":"Winner is O"
                gameIsActive = false
                break
            }
                
        }
    }
    
}

