//
//  View.swift
//  Trial Banner
//
//  Created by Денис Львович on 28.04.2024.
//

import UIKit
import PinLayout

class View: UIView {
    
    lazy var bannerView: BannerView = {
        let view = BannerView(frame: .zero)
        
        self.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layout()
    }
        
    private func layout() {
        backgroundColor = .black
        
        bannerView.pin
            .top(pin.safeArea)
            .horizontally(16.0.scaled)
            .aspectRatio(343.0 / 108.0)
    }
}
