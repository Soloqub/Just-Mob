//
//  BoxView.swift
//  Animated Box
//
//  Created by Денис Львович on 26.04.2024.
//

import UIKit
import PinLayout

class BoxView: UIView {
    
    lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .boxContainerBackground
        
        self.addSubview(view)
        return view
    }()
    
    lazy var boxImageView: UIImageView = {
        let view = UIImageView(image: .boxImage)
        
        containerView.addSubview(view)
        return view
    }()
    
    lazy var timeLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "00:25:14"
        view.textColor = .white
        view.font = FontBuilder
            .systemSemibold(size: 22.0)
            .build
        
        containerView.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layout()
    }
    
    private func layout() {
        backgroundColor = .viewBackground
        
        containerView.pin
            .center()
            .size(168.0.scaled)
        
        containerView.makeRound()
        
        boxImageView.pin
            .hCenter()
            .top(10.0.scaled)
            .size(CGSize(width: 68.0.scaled, height: 85.0.scaled))
        
        timeLabel.pin.below(of: boxImageView)
            .marginTop(17.0.scaled)
            .hCenter()
            .sizeToFit()
    }
}
