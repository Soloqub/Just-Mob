//
//  BoxView.swift
//  Animated Box
//
//  Created by Денис Львович on 28.04.2024.
//

import UIKit
import PinLayout

final class BoxView: UIView {
    
    private var manager: BoxTimerManager?
        
    private lazy var boxImageView: UIImageView = {
        let view = UIImageView(image: .boxImage)
        
        self.addSubview(view)
        return view
    }()
        
    private lazy var timeLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = ""
        view.textColor = .white
        view.textAlignment = .center
        
        self.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layout()
        startAnimations()
    }
    
    func startTimer(secondsLeft: Int) {

        updateTimer(secondsLeft: secondsLeft)
        manager = BoxTimerManager(timeLeft: secondsLeft,
                                  updated: { [weak self] secondsLeft in
            self?.updateTimer(secondsLeft: secondsLeft)
        },
                                  timerDidFinish: {})
    }
    
    private func layout() {
        backgroundColor = .boxContainerBackground
        setFont()
                        
        boxImageView.pin
            .hCenter()
            .top(6.0%)
            .width(40.5%)
            .height(50.6%)
                        
        timeLabel.pin.below(of: boxImageView)
            .marginTop(10.1%)
            .horizontally().sizeToFit(.width)
        
        self.makeRound()
    }
    
    private func setFont() {
        timeLabel.font = FontBuilder
            .systemSemibold(size: 22.0 * bounds.size.height / 168.0.scaled)
            .build
    }
    
    private func startAnimations() {
        boxImageView.shakeAnimation()
    }
    
    private func updateTimer(secondsLeft: Int) {
        let hours = secondsLeft / 3_600
        let minutes = (secondsLeft - hours * 3_600) / 60
        let seconds = secondsLeft - hours * 3_600 - minutes * 60
        timeLabel.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

