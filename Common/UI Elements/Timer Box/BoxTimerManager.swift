//
//  Timer.swift
//  Animated Box
//
//  Created by Денис Львович on 28.04.2024.
//

import Foundation

class BoxTimerManager {
    private var countdownTimer: Timer?
    
    private let queue = DispatchQueue(label: "Timer")
    private let mainQueue = DispatchQueue.main
    
    private var timeLeft: Int {
        didSet {
            if timeLeft >= 0 {
                mainQueue.async {
                    self.updated(self.timeLeft)
                }
            } else {
                mainQueue.async {
                    self.timerDidFinish()
                }
                countdownTimer?.invalidate()
            }
        }
    }
    private var updated: (_ secondsLeft: Int) -> Void
    private var timerDidFinish: () -> Void
    
    init(timeLeft: Int, updated: @escaping (_ secondsLeft: Int) -> Void, timerDidFinish: @escaping () -> Void) {
        self.timeLeft = timeLeft
        self.updated = updated
        self.timerDidFinish = timerDidFinish
        
        initTimer()
    }
    
    private func initTimer() {
        queue.async {
            let timer = Timer.scheduledTimer(timeInterval: 1,
                                                       target: self,
                                                       selector: #selector(self.updateTimer),
                                                       userInfo: nil, repeats: true)
            defer {
                self.countdownTimer = timer
            }

            RunLoop.current.add(timer, forMode: .common)
            RunLoop.current.run()
        }
    }

    @objc func updateTimer() {
        timeLeft -= 1
    }
    
    deinit {
        countdownTimer?.invalidate()
    }
}
