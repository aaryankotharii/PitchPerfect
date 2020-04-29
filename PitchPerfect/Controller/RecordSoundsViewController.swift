//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Aaryan Kothari on 28/04/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController  {
    
    //MARK:- Outlets
    @IBOutlet var recordingLabel: UILabel!
    @IBOutlet var recordButton: UIButton!
    @IBOutlet var stopRecordingButton: UIButton!
    
    //MARK:- Variables
    var audioRecorder : AVAudioRecorder!
    
    //MARK:- Initial Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false
    }
    

    //MARK:- Record
    @IBAction func recordAudio(_ sender: UIButton) {
        
        // UI setup
        configureUI(isRecording: true)
        
        // set a path to store audio
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))

        // set the audio session
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

        // record!
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.delegate = self
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        }
    
    
    //MARK:- Stop
    @IBAction func stopRecording(_ sender: UIButton) {
        
        //stop
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
        // UI SETUP
        configureUI(isRecording: false)
    }
    
    
    //MARK:-  UI Setup for 2 states.
    func configureUI(isRecording: Bool) {
        stopRecordingButton.isEnabled = isRecording
        recordButton.isEnabled = !isRecording
        recordingLabel.text =  isRecording ? "Recording in Progress" : "Tap to Record"
    }
    

    //MARK:- Prepare Segue to PlaySoundsVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stoprecording"{
            let PlaySoundsVC = segue.destination as! PlaySoundsViewController
            let recorderAudioURL = sender as! URL
            PlaySoundsVC.recorderAudioURL = recorderAudioURL
        }
    }
}



//MARK:- AVAudioRecorder Delegate Methods
extension RecordSoundsViewController : AVAudioRecorderDelegate{
    
    //MARK:- Perform segue upon recording completion
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
         flag ? performSegue(withIdentifier: "stoprecording", sender : audioRecorder.url) : print("Recording Failed")
    }
    
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        if let error = error { print( error.localizedDescription) }
    }
}

