//
//  View.swift
//  Insta
//
//  Created by Денис Львович on 28.04.2024.
//

import UIKit
import PinLayout

final class View: UIView {
        
    private lazy var bannerView: BannerView = {
        let view = BannerView(frame: .zero)
        
        self.addSubview(view)
        return view
    }()
    
    lazy var animatedBox: BoxView = {
        let view = BoxView(frame: .zero)
        
        self.addSubview(view)
        return view
    }()
        
    private lazy var tagsCaptionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Подходит для:"
        view.textColor = .white
        view.font = FontBuilder
            .system(size: 12.0)
            .build
        
        self.addSubview(view)
        return view
    }()
    
    lazy var tagsView: TagsView = {
        let view = TagsView(frame: .zero)
        
        self.addSubview(view)
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        
        let flowLayout = FlowLayout()
        let view = UICollectionView(frame: .zero,
                                    collectionViewLayout: flowLayout)
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.minimumInteritemSpacing = 8.0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.sectionInsetReference = .fromSafeArea
        
        view.contentInsetAdjustmentBehavior = .never
        view.backgroundColor = .black
        view.showsVerticalScrollIndicator = false
        
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
        
        animatedBox.pin
            .right(16.0.scaled)
            .bottom(41.0.scaled)
            .size(88.0.scaled)
        
        tagsCaptionLabel.pin
            .below(of: bannerView)
            .marginTop(15.0.scaled)
            .horizontally(16.0.scaled)
            .sizeToFit(.width)
        
        tagsView.pin
            .below(of: tagsCaptionLabel)
            .marginTop(8.0.scaled)
            .left(16.0.scaled)
            .right()
            .height(25.0.scaled)
        
        collectionView.pin
            .below(of: tagsView)
            .marginTop(16.0.scaled)
            .bottom()
            .horizontally(16.0.scaled)
    }
}
