//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Aaryan Kothari on 28/04/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet var recordingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recordAudio(_ sender: UIButton) {
        print("Recording started")
        recordingLabel.text = "Now Recording"
    }
    
    
    @IBAction func stopRecording(_ sender: UIButton) {
        print("Recording Stopped")
    }
}

