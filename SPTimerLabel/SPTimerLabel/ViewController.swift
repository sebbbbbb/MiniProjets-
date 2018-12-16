//
//  ViewController.swift
//  SPTimerLabel
//
//  Created by Sebastien on 16/12/2018.
//  Copyright © 2018 Sebastien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: TimerLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.countLabel.format = .full
        self.countLabel.onCompletionBlock = { label in
            debugPrint("Over ...")
            label.text = "Terminée !!"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.countLabel.duration = 3600
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            self.countLabel.duration = 72023
        }
    }
}

class TimerLabel: UILabel {
    
    enum Format: String {
        case none = ""
        case minutes = "mm:ss"
        case full = "HH:mm:ss"
    }
    
    @IBInspectable var duration: Int = 0 {
        didSet {
            self.gooo()
        }
    }
    
    private var remainingDuration = 0
    private var cpt = 0
    private var timer: Timer?
    
    var format: Format = .none
    var onCompletionBlock: ((TimerLabel) -> Void)?
    
    private func gooo() {
        self.text = String(duration)
        
        self.remainingDuration = self.duration
        
        self.timer?.invalidate()
        self.timer = Timer(fire: Date(), interval: 1, repeats: true) { timer in
            if self.cpt == self.duration {
                timer.invalidate()
                self.onCompletionBlock?(self)
                return
            }
            
            self.cpt += 1
            self.remainingDuration -= 1
            self.text = self.formatTime(duration: self.remainingDuration)
        }
        
        RunLoop.current.add(self.timer!, forMode: .common)
    }
    
    private func formatTime(duration: Int) -> String {
        
        if self.format == .none {
            return String(duration)
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = self.format.rawValue
            formatter.timeZone = TimeZone(identifier: "GMT")
            let date = Date(timeIntervalSince1970: TimeInterval(duration))
            return formatter.string(from: date)
        }
        
    }
    
}
