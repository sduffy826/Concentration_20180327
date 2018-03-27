//
//  ViewController.swift
//  Concentration_20180326
//
//  Created by Sean Duffy on 3/26/18.
//  Copyright © 2018 Sean Duffy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var game: Concentration = Concentration()
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flip count: \(flipCount)"
        }
    }
 
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBAction func cardPushed(_ sender: UIButton) {
        print("cardPushed")
    }
    


}

