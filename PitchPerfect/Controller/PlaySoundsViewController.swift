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
    

    //MARK:- Outlets
    @IBOutlet var snailButton: UIButton!
    @IBOutlet var chipmunkButton: UIButton!
    @IBOutlet var rabbitButton: UIButton!
    @IBOutlet var vaderButton: UIButton!
    @IBOutlet var echoButton: UIButton!
    @IBOutlet var reverbButton: UIButton!
    @IBOutlet var stopButton: UIButton!

    
    //MARK:- Variables
    var recorderAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    
    // MARK: ButtonType (raw values correspond to type of sound played)
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }

    
    //MARK:- Initial Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying )
    }
    

    //MARK:- Play Audio
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch ButtonType(rawValue: sender.tag) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb : true)
        case .none:
            print("NONE")
        }
         configureUI(.playing)
    }
    
    //MARK:- Stop Player
    @IBAction func stopPressed(_ sender: UIButton) {
        stopAudio()
    }
}
