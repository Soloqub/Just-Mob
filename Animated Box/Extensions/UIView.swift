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
}
