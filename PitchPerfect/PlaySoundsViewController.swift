//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Aaryan Kothari on 28/04/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var recorderAudioURL: URL!

    @IBOutlet var snailButton: UIButton!
    @IBOutlet var chipmunkButton: UIButton!
    @IBOutlet var rabbitButton: UIButton!
    @IBOutlet var vaderButton: UIButton!
    @IBOutlet var echoButton: UIButton!
    @IBOutlet var reverbButton: UIButton!
    @IBOutlet var stopButton: UIButton!

    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying )
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        
    }
    
    @IBAction func stopPressed(_ sender: UIButton) {
        
    }
    

}
