//
//  ViewController.swift
//  Dice Game
//
//  Created by Sreejith Thrivikraman on 2019-02-07.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dice_1: UIImageView!
    @IBOutlet weak var dice_2: UIImageView!
 
    let dice_array = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    var dice_number_1 = 0;
    var dice_number_2 = 0;
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func roll_button(_ sender: Any)
    {
        dice_number_1  = Int(arc4random_uniform(5))
        dice_number_2  = Int(arc4random_uniform(5))
        
        dice_1.image = UIImage(named: dice_array[dice_number_1]);
        dice_2.image = UIImage(named: dice_array[dice_number_2]);
        
        
        //print(dice_number_1);
    }
}

