//
//  View.swift
//  Insta
//
//  Created by Денис Львович on 28.04.2024.
//

import UIKit
import PinLayout

class View: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layout()
    }
        
    private func layout() {
        backgroundColor = .brown
    }
}
