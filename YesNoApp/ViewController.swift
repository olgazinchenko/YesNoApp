//
//  ViewController.swift
//  YesNoApp
//
//  Created by ozinchenko.dev on 21/02/2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var answerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerButtonAction(_ sender: UIButton) {
        let answer = Bool.random()
        answerLabel.text = ""
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.answerLabel.text = answer ? "YES" : "NO"
        }
    }
}

