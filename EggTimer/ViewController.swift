//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard" : 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player:AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func hardenessSelected(_ sender: UIButton) {
        
       
        
        
        timer.invalidate()
        
        let hardeness = sender.currentTitle!
        
        totalTime = eggTimes[hardeness]!
        
        progressBar.progress = 0.0
        
        secondsPassed = 0
        
        titleLabel.text = hardeness
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
           if self.secondsPassed < self.totalTime {
                
               
               self.secondsPassed += 1
               progressBar.progress = Float(secondsPassed)/Float(totalTime)
             
               
           } else {
                Timer.invalidate()
                
                self.titleLabel.text = "DONE!"
               
               let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
               player = try! AVAudioPlayer(contentsOf: url!)
               player.play()
               
            }
        }
        
        
        
        
    
        
    }
}
