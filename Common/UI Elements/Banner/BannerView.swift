//
//  BannerView.swift
//  Trial Banner
//
//  Created by Денис Львович on 28.04.2024.
//

import UIKit
import PinLayout

final class BannerView: UIView {
    
    lazy var imagesContainerView: UIView = {
        let view = UIView(frame: .zero)
        
        backgroundImageView.addSubview(view)
        return view
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let view = UIImageView(image: .bannerBackground)
        
        self.addSubview(view)
        return view
    }()
    
    private lazy var imageTopLeftView: UIImageView = {
        let view = UIImageView(image: .photoImageTopLeft)
        
        imagesContainerView.addSubview(view)
        return view
    }()
    
    private lazy var imageTopRightView: UIImageView = {
        let view = UIImageView(image: .photoImageTopRight)
        
        imagesContainerView.addSubview(view)
        return view
    }()
    
    private lazy var imageBottomLeftView: UIImageView = {
        let view = UIImageView(image: .photoImageBottomLeft)
        
        imagesContainerView.addSubview(view)
        return view
    }()
    
    private lazy var imageBottomRightView: UIImageView = {
        let view = UIImageView(image: .photoImageBottomRight)
        
        imagesContainerView.addSubview(view)
        return view
    }()
    
    private lazy var topLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Try three days free trial"
        view.textColor = .white
        view.font = FontBuilder
            .systemSemibold(size: 16.5)
            .build
        
        backgroundImageView.addSubview(view)
        return view
    }()
    
    private lazy var subLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "You will get all premium templates, additional stickers and no ads"
        view.textColor = .sublineTextColor
        view.numberOfLines = 0
        view.font = FontBuilder
            .system(size: 11.5)
            .build
        view.setLineSpacing(lineSpacing: 5.0)
        
        backgroundImageView.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layout()
    }
        
    private func layout() {
        backgroundColor = .black
        
        backgroundImageView.pin
            .all()
        
        layoutImages()
                
        topLabel.pin
            .before(of: imagesContainerView)
            .left(20.0.scaled)
            .top(22.0.scaled)
            .sizeToFit(.width)
        
        subLabel.pin
            .below(of: topLabel, aligned: .left)
            .marginTop(8.0.scaled)
            .width(of: topLabel)
            .sizeToFit(.width)
    }
    
    private func layoutImages() {
        imagesContainerView.pin
            .right(20.0.scaled)
            .vertically(14.0.scaled)
            .aspectRatio(1.225)
                
        imageTopLeftView.pin
            .left()
            .top()
            .height(64%)
            .sizeToFit(.width)
        
        imageBottomLeftView.pin
            .left()
            .bottom()
            .height(29%)
            .sizeToFit(.width)
        
        imageTopRightView.pin
            .right()
            .top()
            .height(29%)
            .sizeToFit(.width)
        
        imageBottomRightView.pin
            .right()
            .bottom()
            .height(64%)
            .sizeToFit(.width)
    }
}
