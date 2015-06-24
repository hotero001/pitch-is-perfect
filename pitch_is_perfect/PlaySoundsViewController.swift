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
    
    //global variables is this first one supposed to be an optional? and :AVAudioPlayer()
    var audioPlayer = AVAudioPlayer()
    var receivedAudio:RecordedAudio!
    
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
        //    var filePathUrl = NSURL.fileURLWithPath(filePath)
        //    audioPlayer = AVAudioPlayer(contentsOfURL: filePathUrl, error: nil)
        //    audioPlayer.enableRate = true
        //}else{
        //    println("nothing here")
        //}
        // Do any additional setup after loading the view.
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
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
    
    @IBAction func lowPitchAudio(sender: UIButton) {
//        audioPlayer.stop()
//        var pitchPlayer = AVAudioPlayerNode()
//        var timePitch = AVAudioUnitTimePitch()
//        timePitch.pitch = 500
//        
//        audioEngine.attachNode(pitchPlayer)
//        audioEngine.attachNode(timePitch)
//        
//        audioEngine.connect(pitchPlayer, to: timePitch, format: myAudioFile.processingFormat)
//        audioEngine.connect()
//        
//        
//        //audioPlayer.pitch = 0.5
//        audioPlayer.currentTime = 0.0
//        audioPlayer.play()
        playAudioWithVariablePitch(1000)
    }
    
    func playAudioWithVariablePitch(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        
        audioEngine.startAndReturnError(nil)
        
        audioPlayer.currentTime = 0.0
        audioPlayerNode.play()
    }
    
    @IBAction func darthVaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
}





