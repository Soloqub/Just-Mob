//
//  Timer.swift
//  Animated Box
//
//  Created by Денис Львович on 28.04.2024.
//

import Foundation

class BoxTimerManager {
    private var countdownTimer: Timer?
    private var timeLeft: Int {
        didSet {
            updated(timeLeft)
        }
    }
    private var updated: (_ secondsLeft: Int) -> Void
    private var timerDidFinish: () -> Void
    
    init(timeLeft: Int, updated: @escaping (_ secondsLeft: Int) -> Void, timerDidFinish: @escaping () -> Void) {
        self.timeLeft = timeLeft
        self.updated = updated
        self.timerDidFinish = timerDidFinish
        
        countdownTimer = Timer.scheduledTimer(timeInterval: 1,
                                              target: self,
                                              selector: #selector(updateTimer),
                                              userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        timeLeft -= 1
    }
    
    deinit {
        countdownTimer?.invalidate()
    }
}
