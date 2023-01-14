//
//  ViewController.swift
//  MunaKello
//
//  Created by Juuso Loikkanen on 4.12.2022.
//  Copyright © 2022 Simo Loikkanen. All rights reserved.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer?

// MARK: - Outlets
class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Dictionary
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totaltime = 0
    var secondsPassed = 0
    
   
    
    // MARK: - Actions
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totaltime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        //MARK: - Timer mechanism
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self,
        // From objective C
            selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        
        if secondsPassed < totaltime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totaltime)
            let percentageProgress = secondsPassed / totaltime
            print(percentageProgress)
            print(Float(secondsPassed) / Float(totaltime))
            
            
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            //MARK: - Play sound, important
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player?.play()
        }
      
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}


