//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Angus on 9/1/2021.


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var myHand       = ""
    let hands        = ["👊🏻", "✋🏻", "✌🏻"]
    let losesAgainst = ["👊🏻":"✌🏻", "✋🏻":"👊🏻", "✌🏻":"✋🏻"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectRock(_ sender: Any) {
        myHand = "👊🏻"
        self.label.text = "You have selected \(myHand)"
    }
    
    @IBAction func selectPaper(_ sender: Any) {
        myHand = "✋🏻"
        self.label.text = "You have selected \(myHand)"
    }
    
    @IBAction func selectScissors(_ sender: Any) {
        myHand = "✌🏻"
        self.label.text = "You have selected \(myHand)"
    }
    
    func finishGame() {
        var message = ""
        
        let iPhoneHand = hands.randomElement()!
        
        if iPhoneHand == myHand {
            message = "It's a 👔"
        } else if losesAgainst[iPhoneHand] == myHand {
            message = "iPhone wins!"
        } else {
            message = "you won!"
        }
        
        self.label.text = "You have selected \(myHand) \niPhone selected \(iPhoneHand)\n\(message)"
    }
    
    @IBAction func play(_ sender: Any) {
        var counter = 3
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {timer in if counter > 0 {
                self.label.text = "You have selected \(self.myHand)\n\(counter)"
            } else {
                timer.invalidate()
                self.finishGame()
            }
            
            counter -= 1
        }
    }
}

