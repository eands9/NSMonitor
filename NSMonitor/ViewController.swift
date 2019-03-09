//
//  ViewController.swift
//  NSMonitor
//
//  Created by Kyle Hernandez on 3/7/19.
//  Copyright © 2019 Kyle Hernandez. All rights reserved.
//

import UIKit
import Firebase
import Speech

class ViewController: UIViewController {

    var modUserName3 = ""
    //var averageTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserName()
        
        observeUpdate()
    }

    func getUserName(){
        
//        let userName = Auth.auth().currentUser?.email as! String
//        let modUserName1 = userName.replacingOccurrences(of: "@", with: "")
//        let modUsername2 = modUserName1.replacingOccurrences(of: ".", with: "")
//        modUserName3 = modUsername2
    }
    func readMe( myText: String) {
        let utterance = AVSpeechUtterance(string: myText )
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    func observeUpdate(){
        //let messageDB = Database.database().reference().child("Users").child("eands9yahoocom").child("1A1")
        
        let messageDB = Database.database().reference().child("Users").child("eands9yahoocom").child("*").child("AvgTime")
        
        messageDB.observe(.childChanged, with: {(snapshot) in
            let snapshotValue = snapshot.value as? [String : AnyObject] ?? [:]
            //et averageTime = snapshotValue["AvgTime"]!
            
            //self.reportFindings(timeInSec: Int(averageTime as! NSNumber))
            //print(averageTime)
            //self.userNameTxt.text = "\(averageTime)"
            //self.readMe(myText: "Kate's average time is \(averageTime) seconds.")
            self.readMe(myText: "Score one for Eric!")
        })
    }
    func reportFindings(timeInSec: Int){
        readMe(myText: "The average time of Eric is \(timeInSec)")
    }
}

