//
//  speechRecognition.swift
//  VenusApp
//
//  Created by DEVESH MANI TRIPATHI on 22/11/18.
//  Copyright © 2018 DEVESH MANI TRIPATHI. All rights reserved.
//

import UIKit
import Speech
class speechRecognition: UIViewController,SFSpeechRecognizerDelegate {

    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var butt: UIButton!
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))!
    
    
    private var recognitionRequest : SFSpeechAudioBufferRecognitionRequest?
    
    private var recognitionTask : SFSpeechRecognitionTask?
    
    private var audioEngine = AVAudioEngine()
    
    
    @IBAction func ButtPress(_ sender: UIButton) {
   
        if audioEngine.isRunning{
            audioEngine.stop()
            recognitionRequest?.endAudio()
            butt.isEnabled = false
            butt.setTitle("Start Recording", for: .normal)
            }else{
    startRecording()
            butt.setTitle("Stop recording", for: .normal)
            
        }
    
    }
    
    func startRecording() {
        
        if recognitionTask != nil {  //1
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()  //2
        do {
            try audioSession.setCategory(AVAudioSessionCategoryRecord)
            try audioSession.setMode(AVAudioSessionModeMeasurement)
            try audioSession.setActive(true, with: .notifyOthersOnDeactivation)
        } catch {
            print("audioSession properties weren't set because of an error.")
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()  //3
        
        guard let inputNode = audioEngine.inputNode else {
            fatalError("Audio engine has no input node")
        }  //4
        
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
        } //5
        
        recognitionRequest.shouldReportPartialResults = true  //6
        
        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in  //7
            
            var isFinal = false  //8
            
            if result != nil {
                
                self.textField.text = result?.bestTranscription.formattedString  //9
                isFinal = (result?.isFinal)!
            }
            
            if error != nil || isFinal {  //10
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.recognitionRequest = nil
                self.recognitionTask = nil
                
                self.butt.isEnabled = true
            }
        })
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)  //11
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()  //12
        
        do {
            try audioEngine.start()
        } catch {
            print("audioEngine couldn't start because of an error.")
        }
        
        textField.text = "Say something, I'm listening!"
        
    
    }
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            butt.isEnabled = true
        }
        butt.isEnabled = false
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        butt.isEnabled = false
        speechRecognizer.delegate = self
        
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
           
            var isButtonEnabled = false
            
            
            switch authStatus{
                
            case .authorized:
                isButtonEnabled = true
                
            case .denied:
                isButtonEnabled = false
                print("Denied")
                
            case .notDetermined:
                isButtonEnabled = false
                print("Not determined")
                
                
            case .restricted:
                isButtonEnabled = false
                
                print("Restricted")
            
            }
            
            OperationQueue.main.addOperation()
                {
                    self.butt.isEnabled = isButtonEnabled
            }
        }



        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
