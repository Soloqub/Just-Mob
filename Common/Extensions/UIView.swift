//
//  UIView.swift
//  Animated Box
//
//  Created by Денис Львович on 27.04.2024.
//

import UIKit

extension UIView {
    func makeRound() {
        self.layer.cornerRadius = self.frame.size.height / 2.0
        self.layer.masksToBounds = true
    }
    
    func setCornerRadius(inPercentOfHeight percentOfHeight: CGFloat) {
        self.layer.cornerRadius = self.frame.size.height * percentOfHeight / 100.0
        self.layer.masksToBounds = true
    }
    
    func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func shakeAnimation() {
        var values: [CGFloat] = [0.0]
        var keyTimes = [0.091]
        
        let maxAngle = -CGFloat.pi * 0.04
        let minAngle = -CGFloat.pi * 0.11
        
        let iterationValues = [0.0, maxAngle, minAngle, maxAngle, minAngle, maxAngle, 0.0]
        let iterationsTimeIntervals = [0.129, 0.017, 0.021, 0.029, 0.021, 0.021, 0.021]

        for _ in 0..<2 {
            values += iterationValues
            
            for interval in iterationsTimeIntervals {
                keyTimes.append((keyTimes.last ?? 0.0) + interval)
            }
        }
        
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.duration = 4.0
        animation.values = values
        animation.keyTimes = keyTimes.map { NSNumber(floatLiteral: $0) }
        animation.repeatCount = .infinity

        self.layer.add(animation, forKey: "rotation")
    }
}
