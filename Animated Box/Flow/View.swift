//
//  BoxView.swift
//  Animated Box
//
//  Created by Денис Львович on 26.04.2024.
//

import UIKit
import PinLayout

class View: UIView {
    
    lazy var boxView: BoxView = {
        let view = BoxView(frame: .zero)
        
        self.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layout()
    }
        
    private func layout() {
        backgroundColor = .viewBackground
                
        boxView.pin
            .hCenter()
            .vCenter(-5%)
            .size(168.0.scaled)
    }
}
