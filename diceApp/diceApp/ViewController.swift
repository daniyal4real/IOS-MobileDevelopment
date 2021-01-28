//
//  ViewController.swift
//  diceApp
//
//  Created by Daniyal on 1/17/21.
//  Copyright © 2021 Daniyal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceOneImageView: UIImageView!
    @IBOutlet weak var diceTwoImageView: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    let diceNames: [String] = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        rollButton.layer.cornerRadius = 4
        rollButton.layer.masksToBounds = true
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let dice1: Int = Int(arc4random()) % 6
        let dice2: Int = Int(arc4random()) % 6
        
        print(dice1)
        print(dice2)
        diceOneImageView.image = UIImage(named: diceNames[dice1])
        diceTwoImageView.image = UIImage(named: diceNames[dice2])
    }
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            rollButtonPressed(rollButton)
        }
    }
    
}

