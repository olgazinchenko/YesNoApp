//
//  ViewController.swift
//  YesNoApp
//
//  Created by ozinchenko.dev on 21/02/2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var answerButton: UIButton!
    
    // Audio player setup
    var audioPlayer: AVAudioPlayer?
    
    func playSound() {
        guard let soundURL = Bundle.main.url(forResource: "spaceJourney", withExtension: "mp3") else {
            fatalError("Sound file not found")
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print("Error initializing audio player: \(error.localizedDescription)")
        }
        
        audioPlayer?.numberOfLoops = -1 // Repeat playing a sound
        audioPlayer?.play()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound()
    }
    
    @IBAction func answerButtonAction(_ sender: UIButton) {
        let answer = Bool.random()
        answerLabel.text = ""
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.answerLabel.text = answer ? "YES" : "NO"
        }

        // Animate label rotation
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = CGFloat.pi * 2 // Full rotation (360 degrees)
        rotationAnimation.duration = 30.0
        rotationAnimation.repeatCount = .infinity
        answerLabel.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
}

