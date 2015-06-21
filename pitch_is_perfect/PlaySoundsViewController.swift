//
//  PlaySoundsViewController.swift
//  pitch_is_perfect
//
//  Created by Hector Otero on 6/20/15.
//  Copyright (c) 2015 Larsen & McDermott Enterprises, LLC. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    //global variables
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
            var filePathUrl = NSURL.fileURLWithPath(filePath)
            audioPlayer = AVAudioPlayer(contentsOfURL: filePathUrl, error: nil)
            audioPlayer.enableRate = true
        }else{
            println("nothing here")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func slowAudio(sender: UIButton) {
         //var audioFile = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("movie_quote", ofType: ".mp3"))
         audioPlayer.stop()
         audioPlayer.rate = 0.5
         audioPlayer.currentTime = 0.0
         audioPlayer.play()
    }
    
    @IBAction func fastAudio(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 1.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        audioPlayer.stop()
    }
}
